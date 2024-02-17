import 'dart:typed_data';

import '../../domain/repository/signup_repository.dart';
import '../datasource/signup_datasource.dart';
class SignUpRepositoryImpl implements SignUpRepository{
  final SignUpDatasource signUpDatasource;

  SignUpRepositoryImpl({required this.signUpDatasource});

  @override
  Future<void> call({required String user, required String password, required String email, required String bio, required Uint8List file }) async{
    final result = await signUpDatasource.call(user: user, password: password, email: email, bio: bio, file: file,);

    return result;
  }

}