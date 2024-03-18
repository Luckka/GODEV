import 'package:godev/app/modules/home/domain/repository/follow_user_repository.dart';
import 'package:godev/app/modules/home/domain/usecase/follow_user_usecase.dart';

class FollowUserUseCaseImpl implements FollowUserUseCase{

  final FollowUserRepository followUserRepository;

  FollowUserUseCaseImpl({required this.followUserRepository});

  @override
  Future<void> call({required String uid, required String followId}) async{
     await followUserRepository.call(uid: uid, followId: followId);
  }

}