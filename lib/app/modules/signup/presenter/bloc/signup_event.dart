import 'package:flutter/cupertino.dart';

abstract class SignUpEvent{

}

class InitialEvent extends SignUpEvent {

}

class NewUserEvent extends SignUpEvent{
  final BuildContext context;

  NewUserEvent(this.context);
}

class PickImageEvent extends SignUpEvent{}

