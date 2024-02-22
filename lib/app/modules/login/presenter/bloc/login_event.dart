import 'package:flutter/cupertino.dart';

abstract class SignInEvent{

}

class InitialEvent extends SignInEvent {

}

class LoginUserEvent extends SignInEvent{
  final BuildContext context;

  LoginUserEvent(this.context);
}

