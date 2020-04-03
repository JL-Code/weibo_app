import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:weiboapp/home_screen.dart';
import 'package:weiboapp/models/home_timeline_response.dart';
import 'package:weiboapp/status_screen.dart';

var rootHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeScreen();
});

var weiboDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print(params);
  return StatusScreen(
    statuses: Statuses(),
  );
});
