abstract interface class UpdateLikeDatasource{
  Future<void> call({
    required String postId,
    required String uid,
    required List likes,
  });
}