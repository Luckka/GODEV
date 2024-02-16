import 'dart:typed_data';

class SignUpState{
  SignUpState init(){
    return SignUpState();
  }

  SignUpState clone(){
    return SignUpState();
  }
}

final class NewUserState extends SignUpState{}

class PickImageState extends SignUpState{
  final Uint8List image;

  PickImageState({required this.image});
}