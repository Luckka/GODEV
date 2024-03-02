import 'package:godev/app/modules/home/domain/repository/update_like_repository.dart';
import 'package:godev/app/modules/home/domain/usecase/update_like_usecase.dart';
import 'package:godev/app/modules/home/infra/datasource/update_like_datasource.dart';

class UpdateLikeUseCaseImpl implements UpdateLikeUseCase{

  final UpdateLikeRepository updateLikeRepository;

  UpdateLikeUseCaseImpl({required this.updateLikeRepository});

  @override
  Future<void> call({required String postId, required String uid, required List likes}) async{
    final result = await updateLikeRepository.call(postId: postId, uid: uid, likes: likes);

    return result;
  }

}