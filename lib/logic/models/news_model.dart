class NewsModel {
  late final String newsType;
  late final String image;
  late final String authorName;
  late final String title;
  late final String description;

  NewsModel({
    required this.newsType,
    required this.image,
    required this.authorName,
    required this.title,
    required this.description,
  });

  NewsModel.fromJson(Map<dynamic, dynamic> json) {
    newsType = json['news_type'];
    image = json['image'];
    authorName = json['author_name'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['news_type'] = newsType;
    data['image'] = image;
    data['author_name'] = authorName;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
