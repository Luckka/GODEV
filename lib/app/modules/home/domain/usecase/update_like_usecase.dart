abstract interface class UpdateLikeUseCase{
  Future<void> call({
    required String postId,
    required String uid,
    required List likes,
  });
}