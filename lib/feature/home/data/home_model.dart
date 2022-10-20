class HomeModel {
  List<Article>? article;
  String? totalResults;
  String? error;
  HomeModel({this.article, this.totalResults});
  HomeModel.withError(String errorMessage) {
    error = errorMessage;
  }
  factory HomeModel.fromjson(Map<String, dynamic> json) {
    return HomeModel(
      article:
          List<Article>.from(json['articles'].map((x) => Article.fromjson(x))),
    );
  }
}

class Article {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Article.fromjson(Map<String, dynamic> json) {
    return Article(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
