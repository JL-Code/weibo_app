import 'package:flutter/material.dart';

enum ASPECT { EMOTION }

class ApplicationModel extends InheritedModel<ASPECT> {
  final Map<String, String> emotionMap;

  ApplicationModel({@required this.emotionMap, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(ApplicationModel old) {
    // TODO: implement updateShouldNotify
    return true;
  }

  @override
  bool updateShouldNotifyDependent(
      InheritedModel<ASPECT> old, Set<ASPECT> aspects) {
    // TODO: implement updateShouldNotifyDependent
    return null;
  }

  /// 获取官方表情
//  Map<String, String> getEmotions() {
//    return emotionMap;
//  }

  static ApplicationModel of(BuildContext context, {ASPECT aspect}) {
    var model = InheritedModel.inheritFrom<ApplicationModel>(context, aspect: aspect);
    return model;
  }
}
