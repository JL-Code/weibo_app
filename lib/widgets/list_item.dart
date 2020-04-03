import 'package:flutter/material.dart';
import 'package:weiboapp/application_model.dart';
import 'package:weiboapp/icons.dart';
import 'package:weiboapp/utils/avatar_builder.dart';
import 'package:weiboapp/models/home_timeline_response.dart';
import 'package:weiboapp/utils/date_util.dart';
import 'package:weiboapp/utils/text_util.dart';
import 'package:weiboapp/widgets/ripple.dart';

class ListItem extends StatelessWidget {
  final Statuses statuses;
  final GestureTapCallback onTap;

  ListItem({this.statuses, this.onTap});

  @override
  Widget build(BuildContext context) {
      var model = ApplicationModel.of(context);
      return Ripple(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: <Widget>[
            _buildHeader(statuses), // header
            _buildBody(statuses, model.emotionMap), // body
            _buildFooter(statuses), // footer
          ],
        ),
      ),
    );
  }

  /// 构建面板头部
  _buildHeader(Statuses statuses) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          AvatarBuilder.build(statuses.user.avatarHd, height: 45, width: 45),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                statuses.user.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Text(
                    DateUtil().parse(statuses.createdAt).format("MM-dd HH:mm"),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  /// 构建面板主体
  _buildBody(Statuses statuses, Map<String, String> emotions) {
    var widgets = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextUtil.format(statuses.text, emotions),
        SizedBox(height: 15),
      ],
    );
    var widget = _buildGallery(statuses.picUrls);
    if (widget != null) widgets.children.add(widget);
    return widgets;
  }

  _buildGallery(List<PicUrls> urls) {
    if (urls.isEmpty) {
      return null;
    }

    /// Wrap 自动换行
    return Wrap(
      spacing: 4, // 主轴(水平)方向间距
      runSpacing: 4, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: _buildGridTileList(urls),
    );
  }

  /// 构建图片列表
  _buildGridTileList(List<PicUrls> urls) {
    return List<Container>.generate(
      urls.length,
      (int index) {
        return Container(
          child: FadeInImage.assetNetwork(
            placeholder: "assets/images/default_nor_avatar.png",
            height: 100,
            width: 100,
            image:
                urls[index].thumbnailPic.replaceFirst("thumbnail", "bmiddle"),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  /// 构建面板底部
  _buildFooter(Statuses statuses) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildIconBtn(AppIcons.dianzan, count: statuses.attitudesCount),
        _buildIconBtn(AppIcons.duihua, count: statuses.commentsCount),
        _buildIconBtn(AppIcons.fenxiang, count: statuses.repostsCount),
      ],
    );
  }

  /// 构建图标按钮
  _buildIconBtn(IconData icon, {int count}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
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
}
