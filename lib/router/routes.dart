import 'package:fluro/fluro.dart';
import 'package:weiboapp/router/route_handler.dart';

class Routes {
  static const String root = "/";
  static const String weibo_detail = "/statues/detail";

  static configureRoutes(Router router) {
    router..define(root, handler: rootHandler)..define(weibo_detail, handler: weiboDetailHandler);
  }
}
