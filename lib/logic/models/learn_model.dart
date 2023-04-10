class LearnModel {
  late final String image;
  late final String title;
  late final String time;
  late final String description;
  late bool isPro;

  LearnModel({
    required this.image,
    required this.title,
    required this.time,
    required this.description,
    this.isPro = false,
  });

  LearnModel.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'];
    title = json['title'];
    time = json['time'];
    description = json['description'];
    isPro = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['time'] = time;
    data['description'] = description;
    return data;
  }
}
