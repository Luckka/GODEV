
abstract interface class SignUpDatasource {

  Future<void> call({
    required String user,
    required String password,
    required String email,
    required String bio,


  });
}