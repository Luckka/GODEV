abstract interface class PostCommentRepository {
  Future<void> call({
    required String postId,
    required String text,
    required String uid,
    required String name,
    required String profilePic
  });
}