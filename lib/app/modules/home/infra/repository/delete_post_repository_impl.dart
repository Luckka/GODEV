import 'package:godev/app/modules/home/domain/repository/delete_post_repository.dart';
import 'package:godev/app/modules/home/infra/datasource/delete_post_datasource.dart';

class DeletePostRepositoryImpl implements DeletePostRepository{

  final DeletePostDatasource deletePostDatasource;

  DeletePostRepositoryImpl({required this.deletePostDatasource});

  @override
  Future<void> call({required String postId}) async{
    await deletePostDatasource.call(postId: postId);
  }

}