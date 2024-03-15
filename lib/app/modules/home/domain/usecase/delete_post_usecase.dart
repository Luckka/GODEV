abstract interface class DeletePostUseCase {
  Future<void> call({
    required String postId,
  });
}