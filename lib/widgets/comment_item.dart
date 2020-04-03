import 'package:flutter/material.dart';
import 'package:weiboapp/application_model.dart';
import 'package:weiboapp/icons.dart';
import 'package:weiboapp/utils/avatar_builder.dart';
import 'package:weiboapp/utils/text_util.dart';

class CommentItem extends StatelessWidget {
  const CommentItem(
      {Key key,
      this.text,
      this.avatar,
      this.name,
      this.createdAt,
      this.dianzanCount,
      this.fenxiangCount})
      : super(key: key);
  final String text;
  final String avatar;
  final String name;
  final String createdAt;
  final int dianzanCount;
  final int fenxiangCount;

  /// 构建面板头部
  _buildHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AvatarBuilder.build(avatar),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      createdAt,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
          _buildIconBtn(AppIcons.dianzan, count: 0),
          _buildIconBtn(AppIcons.fenxiang, count: 0),
        ],
      ),
    );
  }

  /// 构建图标按钮
  _buildIconBtn(IconData icon, {int count}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          iconSize: 18,
          color: const Color(0xff939393),
          onPressed: () {},
        ),
        Text(
          count.toString(),
          style: TextStyle(
            color: const Color(0xff939393),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var model = ApplicationModel.of(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          TextUtil.format(text, model.emotionMap),
        ],
      ),
    );
  }
}
