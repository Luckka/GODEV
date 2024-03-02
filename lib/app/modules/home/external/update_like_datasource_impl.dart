import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:godev/app/modules/home/infra/datasource/update_like_datasource.dart';

class UpdateLikeDatasourceImpl implements UpdateLikeDatasource{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> call({required String postId, required String uid, required List likes}) async{
     try{
       
       if(likes.contains(uid)){
        await firestore.collection('posts').doc(postId).update({
           'likes': FieldValue.arrayRemove([uid]),
         });
       }else{
         await firestore.collection('posts').doc(postId).update({
           'likes': FieldValue.arrayUnion([uid]),
         });
       }
       
       
     }catch(err){
       print(err);
     }
         
  }
  
}