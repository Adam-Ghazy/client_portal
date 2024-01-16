class TutorialModel {
  late int id;
  late String author;
  late String title;
  late String description;
  late String duration;
  late String urlThumbnail;
  late String publishedAt;
  late String link;

  TutorialModel({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.duration,
    required this.urlThumbnail,
    required this.publishedAt,
    required this.link,
  });

  TutorialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    duration = json['duration'];
    urlThumbnail = json['url_thumbnail'];
    publishedAt = json['published_at'];
    link = json['link'];
  }
}
