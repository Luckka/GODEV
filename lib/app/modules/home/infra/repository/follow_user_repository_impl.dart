import 'package:godev/app/modules/home/domain/repository/follow_user_repository.dart';
import 'package:godev/app/modules/home/infra/datasource/follow_user_datasource.dart';

class FollowUserRepositoryImpl implements FollowUserRepository{

  final FollowUserDatasource followUserDatasource;

  FollowUserRepositoryImpl({required this.followUserDatasource});

  @override
  Future<void> call({required String uid, required String followId}) async{
    await followUserDatasource.call(uid: uid, followId: followId);
  }

}