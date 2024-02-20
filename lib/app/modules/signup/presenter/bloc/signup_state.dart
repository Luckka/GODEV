import 'dart:typed_data';

class SignUpState{
  SignUpState init(){
    return SignUpState();
  }

  SignUpState clone(){
    return SignUpState();
  }
}
 class NewUserState extends SignUpState{}

class PickImageState extends SignUpState{
  final Uint8List image;

  PickImageState({required this.image});
}

class SignUpErrorState extends SignUpState{

}

class LoadingSignUpState extends SignUpState{

}