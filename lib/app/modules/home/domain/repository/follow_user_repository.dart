abstract interface class FollowUserRepository {
  Future<void> call({
    required String uid,
    required String followId,
  });
}