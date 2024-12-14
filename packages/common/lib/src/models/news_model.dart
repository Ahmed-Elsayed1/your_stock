class NewsModel {
  String? title;
  String? url;
  String? summary;
  String? bannerImage;

  NewsModel({
    this.title,
    this.url,
    this.summary,
    this.bannerImage,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    summary = json['summary'];
    bannerImage = json['banner_image'];
  }
}
