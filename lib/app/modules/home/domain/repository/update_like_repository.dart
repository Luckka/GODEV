abstract interface class UpdateLikeRepository{
  Future<void> call({
    required String postId,
    required String uid,
    required List likes
  });
}