class LessonModel {
  int? id;
  String? title;
  String? content;
  String? icon;

  LessonModel({this.id, this.title, this.content, this.icon});

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['icon'] = icon;
    return data;
  }
}
