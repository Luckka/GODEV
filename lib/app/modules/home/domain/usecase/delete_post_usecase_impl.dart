import 'package:godev/app/modules/home/domain/repository/delete_post_repository.dart';
import 'package:godev/app/modules/home/domain/usecase/delete_post_usecase.dart';

class DeletePostUseCaseImpl implements DeletePostUseCase{

  final DeletePostRepository deletePostRepository;

  DeletePostUseCaseImpl({required this.deletePostRepository});
  @override
  Future<void> call({required String postId}) async{
    final result = await deletePostRepository.call(postId: postId);

    return result;
  }

}