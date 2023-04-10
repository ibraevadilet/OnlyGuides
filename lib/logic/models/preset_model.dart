class PresetModel {
  late final String image;
  late final String title;
  late final String description;

  PresetModel({
    required this.image,
    required this.title,
    required this.description,
  });

  PresetModel.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
