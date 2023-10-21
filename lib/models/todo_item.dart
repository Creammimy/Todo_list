class PhotoAlbum {
  final int userId;
  final int id;
  final String title;

  PhotoAlbum({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory PhotoAlbum.fromJson(Map<String, dynamic> json) {
    return PhotoAlbum(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}