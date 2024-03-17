class HttpModel {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  HttpModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  HttpModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        author = json["author"],
        width = json["width"],
        height = json["height"],
        url = json["url"],
        downloadUrl = json["download_url"];

  // 또는 아래 코드로 작성 가능.
  // factory HttpModel.fromJson(Map<String, dynamic> json) {
  //   return HttpModel(
  //       id : json["id"],
  //       author : json["author"],
  //       width : json["width"],
  //       height : json["height"],
  //       url : json["url"],
  //       downloadUrl : json["download_url"],
  //   );
  // }
}