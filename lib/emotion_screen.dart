import 'package:flutter/material.dart';
import 'package:weiboapp/application_model.dart';
import 'package:weiboapp/constants.dart';

class EmotionScreen extends StatefulWidget {
  @override
  _EmotionScreenState createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  /// 构建图标列表
  _buildIcons(Map<String, String> emotions) {
    var keys = emotions.keys.toList();
    return Wrap(
      children: List.generate(keys.length, (index) {
        var url = emotions[keys[index]];
        return Container(
          padding: EdgeInsets.all(5),
          child: FadeInImage.assetNetwork(
            placeholder: Constants.ImagePlaceholder,
            image: url,
            fit: BoxFit.cover,
            height: 16,
            width: 16,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var model = ApplicationModel.of(context);
    var keys = model.emotionMap.keys;
    return Scaffold(
      appBar: AppBar(
        title: Text('官方表情包${keys.length}'),
      ),
      body: _buildIcons(model.emotionMap),
    );
  }
}
