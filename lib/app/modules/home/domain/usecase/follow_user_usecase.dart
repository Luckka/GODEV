abstract interface class FollowUserUseCase {
  Future<void> call({
    required String uid,
    required String followId,
  });
}