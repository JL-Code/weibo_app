import 'package:dio/dio.dart';
import 'package:weiboapp/constants.dart';
import 'package:weiboapp/models/emotion.dart';

/// 获取官方表情
Future<List<Emotion>> fetchEmotions() async {
  var path =
      "${Constants.HOST}/2/emotions.json?access_token=${Constants.AccessToken}";
  try {
    var res = await Dio().get<List<dynamic>>(path);
    var response = res.data.map((item) => Emotion.fromJson(item)).toList();
    return response;
  } catch (e) {
    print(e);
    return [];
  }
}
