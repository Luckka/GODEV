import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:godev/app/core/services/firebase_firestore/firestore_service.dart';
import 'package:godev/app/modules/signup/domain/usecase/signup_usecase_impl.dart';




void main(){



  group('FirestoreService', () {
    FakeFirebaseFirestore? fakeFirebaseFirestore;
    const Map<String,dynamic> data = {'data' : '42'};

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
    });

    group('Collection Operations', () {
      test('setDataOnDocument runs the correct operations in the transaction', () async{
        final FirestoreService firestoreService = FirestoreService(firestore: fakeFirebaseFirestore!);

        const String collectionPath = 'collectionPath';
        const String documentPath = 'documentPath';

        await firestoreService.setDataOnDocument(data: data, documentPath: documentPath, collectionPath: collectionPath);

        final DocumentReference<Map<String,dynamic>> documentReference = fakeFirebaseFirestore!.collection(collectionPath).doc(documentPath);

        final DocumentSnapshot<Map<String,dynamic>> actualDocumentSnapshot = await documentReference.get();

        final Map<String,dynamic>? actualData = actualDocumentSnapshot.data();

        const Map<String,dynamic> expectedData = data;

        expect(actualData, expectedData);
      });
    });
  });





}