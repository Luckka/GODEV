import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:godev/app/modules/home/domain/repository/post_comment_repository.dart';
import 'package:godev/app/modules/home/domain/usecase/post_comment_usecase.dart';
import 'package:godev/app/modules/home/infra/datasource/post_comment_datasource.dart';
import 'package:uuid/uuid.dart';

class PostCommentDatasourceImpl implements PostCommentDatasource{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> call({required String postId, required String text, required String uid, required String name, required String profilePic}) async{

      try{

        if(text.isNotEmpty){
          String commentId = const Uuid().v1();
          await firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
            'profilePic': profilePic,
            'name': name,
            'uid': uid,
            'text': text,
            'commentId':commentId,
            'datePublished': DateTime.now()
          });
        }else{
          print('Empty text');
        }

      }catch(err){

      }
  }

}