abstract interface class DeletePostDatasource{
  Future<void> call({
    required String postId,
  });
}