import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:godev/app/modules/home/infra/datasource/delete_post_datasource.dart';

class DeletePostDatasourceImpl implements DeletePostDatasource{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> call({required String postId}) async{
    try{
      await firestore.collection('posts').doc(postId).delete();
    }catch(err){
      print(err);
    }
  }

}