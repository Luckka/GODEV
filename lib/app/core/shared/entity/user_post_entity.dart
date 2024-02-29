class UserPostEntity {
  final String? description;
  final String? uid;
  final String? postId;
  final DateTime? datePublished;
  final String? postUrl;
  final String? postImage;
  final String? username;
  final List? likes;

  UserPostEntity(
      {required this.description, required this.username,
      required this.uid,
      required this.postId,
      required this.datePublished,
      required this.postUrl,
      required this.postImage, required this.likes
      });
}
