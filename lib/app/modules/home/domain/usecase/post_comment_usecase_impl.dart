import 'package:godev/app/modules/home/domain/repository/post_comment_repository.dart';
import 'package:godev/app/modules/home/domain/usecase/post_comment_usecase.dart';

class PostCommentUseCaseImpl implements PostCommentUseCase{

  final PostCommentRepository postCommentRepository;

  PostCommentUseCaseImpl({required this.postCommentRepository});

  @override
  Future<void> call({required String postId, required String text, required String uid, required String name, required String profilePic}) async{
    final result = await postCommentRepository.call(postId: postId, text: text, uid: uid, name: name, profilePic: profilePic);

    return result;
  }

}