import 'package:godev/app/modules/home/domain/repository/post_comment_repository.dart';
import 'package:godev/app/modules/home/domain/usecase/post_comment_usecase.dart';
import 'package:godev/app/modules/home/infra/datasource/post_comment_datasource.dart';

class PostCommentRepositoryImpl implements PostCommentRepository{

  final PostCommentDatasource postCommentDatasource;

  PostCommentRepositoryImpl({required this.postCommentDatasource});

  @override
  Future<void> call({required String postId, required String text, required String uid, required String name, required String profilePic}) async{
    final result = await postCommentDatasource.call(postId: postId, text: text, uid: uid, name: name, profilePic: profilePic);

    return result;
  }

}