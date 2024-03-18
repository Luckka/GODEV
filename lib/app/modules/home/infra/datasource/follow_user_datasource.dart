abstract interface class FollowUserDatasource {
  Future<void> call({
    required String uid,
    required String followId,
  });
}