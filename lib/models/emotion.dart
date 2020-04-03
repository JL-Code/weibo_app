/// 表情类
class Emotion {
  String category;
  bool common;
  bool hot;
  String icon;
  String phrase;
  String picid;
  String type;
  String url;
  String value;

  Emotion(
      {this.category,
      this.common,
      this.hot,
      this.icon,
      this.phrase,
      this.picid,
      this.type,
      this.url,
      this.value});

  Emotion.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    common = json['common'];
    hot = json['hot'];
    icon = json['icon'];
    phrase = json['phrase'];
    picid = json['picid'];
    type = json['type'];
    url = json['url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['common'] = this.common;
    data['hot'] = this.hot;
    data['icon'] = this.icon;
    data['phrase'] = this.phrase;
    data['picid'] = this.picid;
    data['type'] = this.type;
    data['url'] = this.url;
    data['value'] = this.value;
    return data;
  }
}
