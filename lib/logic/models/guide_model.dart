class GuideModel {
  late final String socialType;
  late final String image;
  late final String title;
  late final String description;
  late bool isPro;

  GuideModel({
    required this.socialType,
    required this.image,
    required this.title,
    required this.description,
    this.isPro = false,
  });

  GuideModel.fromJson(Map<dynamic, dynamic> json) {
    socialType = json['social_type'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    isPro = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['social_type'] = socialType;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
