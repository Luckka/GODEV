import 'package:godev/app/modules/home/domain/repository/update_like_repository.dart';
import 'package:godev/app/modules/home/infra/datasource/update_like_datasource.dart';

class UpdateLikeRepositoryImpl implements UpdateLikeRepository{
  final UpdateLikeDatasource updateLikeDatasource;

  UpdateLikeRepositoryImpl({required this.updateLikeDatasource});

  @override
  Future<void> call({required String postId, required String uid, required List likes}) async{
    final result = await updateLikeDatasource.call(postId: postId, uid: uid, likes: likes);

    return result;
  }

}