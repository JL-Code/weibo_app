import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weiboapp/constants.dart' show Constants, AppColors;
import 'package:weiboapp/models/comment_response.dart';

import 'models/comment_response.dart';
import 'models/home_timeline_response.dart';
import 'utils/avatar_builder.dart';
import 'utils/date_util.dart';
import 'widgets/comment_item.dart';
import 'widgets/list_item.dart';

class StatusScreen extends StatefulWidget {
  final Statuses statuses;

  StatusScreen({this.statuses});

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _controller;
  ScrollController _scrollViewController;
  List<String> tabLabels;
  CommentResponse response;
  bool _commentLoaded = false;

  @override
  void initState() {
    super.initState();
    tabLabels = ["赞", "评论", "转发"];
    _controller = TabController(
        length: tabLabels.length, vsync: ScrollableState(), initialIndex: 0);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    response = new CommentResponse(comments: List<Comments>());
    _getComments(widget.statuses.id);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _controller.dispose();
  }

  _getComments(int id) {
    var path =
        "${Constants.HOST}/2/comments/show.json?access_token=${Constants.AccessToken}&id=$id";
    Dio().get(path).then((res) {
      var result = CommentResponse.fromJson(res.data);
      setState(() {
        response = result;
        _commentLoaded = true;
      });
    }).catchError((Object e) {
      print(e);
    });
  }

  _buildComment(Comments comment) {
    var createdAt = DateUtil().parse(comment.createdAt).format("MM-dd HH:mm");

    /// dart 内的日期 月份和星期都是从1开始。
    return CommentItem(
      text: comment.text,
      avatar: comment.user.avatarHd,
      name: comment.user.name,
      createdAt: createdAt,
      dianzanCount: 0,
      fenxiangCount: 0,
    );
  }

  /// 构建微博详情界面
  _buildCustomScrollView(Statuses statuses) {
    var slivers = <Widget>[
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: ListItem(statuses: statuses),
        ),
      ),
    ];
    if (_commentLoaded) {
      slivers.add(SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return _buildComment(response.comments[index]);
          },
          childCount: response.comments.length,
        ),
      ));
    } else {
      slivers.add(SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ));
    }
    return CustomScrollView(slivers: slivers);
  }

  /// 显示模态底部弹层 用于承载评论输入区域
  /// TODO: 需要自己写一个支持回调函数的模态弹层。
  _showModelBottomSheet(BuildContext context) {
    var user = widget.statuses.user;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        /// TODO: 需要添加一个AnimatedPadding Widget包住不然 TextField 会被键盘遮住，还不知道为啥！
        return AnimatedPadding(
          //边距（必要）
          // 显示器的部分被系统UI完全遮挡， 通常由设备的键盘。当移动设备的键盘可见`viewInsets.bottom`时
          // 对应于键盘的顶部。
          ///  this.left = 0.0, this.top = 0.0,this.right = 0.0,this.bottom = 0.0,
          padding: MediaQuery.of(context).viewInsets,
          //时常 （必要）
          duration: const Duration(milliseconds: 100),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  /// TextField 详细用法参考：(https://juejin.im/post/5b6bdb406fb9a04f89785cb5#heading-3)
                  child: TextField(
                    autofocus: true,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      /// placeholder
                      hintText: Constants.ADD_COMMENT,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                  ),
                  padding: EdgeInsets.all(7),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 15),
                    AvatarBuilder.build(user.avatarHd, size: 20),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.photo,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        debugPrint("select photo");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.alternate_email,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        debugPrint("select alternate_email");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        debugPrint("select sentiment_satisfied");
                      },
                    ),
                    Expanded(
                      child: Text(
                        Constants.INPUT_MAX_WORDS,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: const Color(AppColors.Gray)),
                      ),
                    ),
                    IconButton(
                      /// 旋转组件 Transform
                      icon: Transform(
                        child: Icon(
                          Icons.send,
                          color: const Color(AppColors.Gray),
                        ),

                        /// Rotate this matrix [angle] radians around Z
                        /// 360 deg = 2π
                        transform: Matrix4.identity()..rotateZ(0 * pi / 4),
                      ),
                      onPressed: () {
                        debugPrint("select send");
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = widget.statuses.user;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AvatarBuilder.build(user.avatarHd, size: 20),
            SizedBox(width: 5),
            Text(user.name, style: TextStyle(fontSize: 14)),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildCustomScrollView(widget.statuses),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            AvatarBuilder.build(user.avatarHd),
            Expanded(
              child: GestureDetector(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    Constants.ADD_COMMENT,
                    style: TextStyle(
                      color: const Color(AppColors.Gray),
                      fontSize: 16,
                    ),
                  ),
                ),
                onTap: () {
                  _showModelBottomSheet(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// 评论组件
class CommentField extends StatefulWidget {
  @override
  _CommentFieldState createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//    this.leading,//前导标题
//    this.title,//标题
//    this.actions,//菜单
//    this.flexibleSpace,//可以展开区域，通常是一个FlexibleSpaceBar
//    this.bottom,//底部内容区域
//    this.elevation,//阴影
//    this.forceElevated: false,
//    this.backgroundColor,背景颜色
//    this.brightness,//主题明亮
//    this.iconTheme,图标主题
//    this.textTheme,//文字主题
//    this.primary: true,//是否预留高度
//    this.centerTitle,标题是否居中
//    this.expandedHeight,//展开高度
//    this.floating: false,//是否随着滑动隐藏标题
//    this.pinned: false,//是否固定在顶部

//_buildNestedScrollView(Statuses statuses) {
//  return NestedScrollView(
//    controller: _scrollViewController,
//    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//      return <Widget>[
//        SliverToBoxAdapter(
//          child: ListItem(statuses: statuses),
//        ),
//        SliverAppBar(
//          pinned: true,
//          floating: true,
//          backgroundColor: Colors.red,
//          elevation: 0,
//          expandedHeight: 40,
//          bottom: TabBar(controller: _controller, tabs: [
//            Tab(
//              child: Text("赞"),
//            ),
//            Tab(
//              child: Text("评论"),
//            ),
//            Tab(
//              child: Text("转发"),
//            ),
//          ]),
//        )
//      ];
//    },
//    body: TabBarView(controller: _controller, children: [
//      Column(
//        children: <Widget>[
//          Text("评论View1212"),
//          Text("评论View1212"),
//          Text("评论View1212"),
//          Text("评论View1212"),
//        ],
//      ),
//      Text("评论View12"),
//      Text("评论View1212"),
//    ]),
//  );
//}
