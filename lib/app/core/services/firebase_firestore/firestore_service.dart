import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore;

  const FirestoreService({required this.firestore});


  Future<void> setDataOnDocument({required Map<String,dynamic> data,required String documentPath,required String collectionPath}) async{
     await firestore.collection(collectionPath).doc(documentPath).set(data);


  }

}