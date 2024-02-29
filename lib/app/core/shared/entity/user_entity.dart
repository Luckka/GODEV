class UserEntity {
  final String? email;
  final String? photoUrl;
  final String? username;
  final String? bio;
  final List? followers;
  final List? following;
  final String? uid;

  UserEntity(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following});
}
