import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:weiboapp/application_model.dart';
import 'package:weiboapp/router/application.dart';
import 'package:weiboapp/router/routes.dart';


/// todo:
/// 1.细节优化
/// 1.1 [x]时间格式化
/// 1.2 图片预览
/// 1.3 超链接处理
/// 1.4 视频播放
/// 1.5 [x]官方表情支持 [不紧急][一般]
/// 2.功能完善d
/// 2.1 评论支持
/// 2.2 转发支持
/// 2.3 点赞支持
/// 2.4 [x]查看微博详情 [优先]
/// 2.5 [x] 列表分页支持
/// 2.6 [x] 显示评论列表 [优先]
/// 2.7 显示点赞列表 [优先]
/// 2.8 显示转发列表 [优先]
/// 3.技术POC
/// 3.1 路由
///

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationManagerWidget(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

class ApplicationManagerWidget extends StatefulWidget {
  final Widget child;

  ApplicationManagerWidget({@required this.child});

  @override
  _ApplicationManagerWidgetState createState() =>
      _ApplicationManagerWidgetState();
}

class _ApplicationManagerWidgetState extends State<ApplicationManagerWidget> {
  final Map<String, String> _mapEmotions = new Map<String, String>();

  @override
  initState() {
    super.initState();
    _initEmotions();
  }

  /// 初始表情数据
  void _initEmotions() async {
    String jsonstr =
        await DefaultAssetBundle.of(context).loadString("assets/emotion.json");
    List list = json.decode(jsonstr);
    list.forEach((item) {
      _mapEmotions[item['value']] = item['url'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationModel(
      emotionMap: _mapEmotions,
      child: widget.child,
    );
  }
}
