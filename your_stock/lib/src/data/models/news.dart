
class News {
  String? title;
  String? url;
  String? summary;
  String? bannerImage;


    News.fromJson (Map<String, dynamic> json){
    title = json['title'];
    url = json['url'];
    summary = json['summary'];
    bannerImage = json['banner_image'];
  }
}