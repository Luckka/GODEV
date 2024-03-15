abstract interface class DeletePostRepository {
  Future<void> call({
    required String postId,
  });
}