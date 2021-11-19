import 'dart:convert';

List<ArticlesResponse> articlesResponseFromJson(String str) => List<ArticlesResponse>.from(json.decode(str).map((x) => ArticlesResponse.fromJson(x)));

String articlesResponseToJson(List<ArticlesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticlesResponse {
    ArticlesResponse({
        required this.id,
        required this.createdAt,
        required this.contributorName,
        required this.contributorAvatar,
        required this.title,
        required this.content,
        required this.contentThumbnail,
        required this.slideshow,
    });

    String id;
    DateTime createdAt;
    String contributorName;
    String contributorAvatar;
    String title;
    String content;
    String contentThumbnail;
    List<String> slideshow;

    factory ArticlesResponse.fromJson(Map<String, dynamic> json) => ArticlesResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        contributorName: json["contributorName"],
        contributorAvatar: json["contributorAvatar"],
        title: json["title"],
        content: json["content"],
        contentThumbnail: json["contentThumbnail"],
        slideshow: List<String>.from(json["slideshow"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "contributorName": contributorName,
        "contributorAvatar": contributorAvatar,
        "title": title,
        "content": content,
        "contentThumbnail": contentThumbnail,
        "slideshow": List<dynamic>.from(slideshow.map((x) => x)),
    };
}
