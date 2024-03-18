import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:godev/app/modules/home/infra/datasource/follow_user_datasource.dart';

class FollowUserDatasourceImpl implements FollowUserDatasource{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  @override
  Future<void> call({required String uid, required String followId}) async{
     try{
       
      DocumentSnapshot snap =  await firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if(following.contains(followId)){
        await firestore.collection('users').doc(followId).update({
            'followers': FieldValue.arrayRemove([uid])
        });
        await firestore.collection('users').doc(followId).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else{
        await firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });
        await firestore.collection('users').doc(followId).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
       
     }catch(err){
       print(err);
     }
  }
  
}