class Article {
  final int id;
  final String categoryName;
  final String userName;
  final String title;
  final String content;
  final String thumbnail;
  final String status;
  final String slug;

  Article({
    required this.id,
    required this.categoryName,
    required this.userName,
    required this.title,
    required this.content,
    required this.thumbnail,
    required this.status,
    required this.slug,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      categoryName: json['category_name'],
      userName: json['user_name'],
      title: json['title'],
      content: json['content'],
      thumbnail: json['thumbnail'],
      status: json['status'],
      slug: json['slug'],
    );
  }
}
