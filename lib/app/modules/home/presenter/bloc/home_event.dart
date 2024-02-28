import 'package:flutter/cupertino.dart';

abstract class HomeEvent{

}

class InitialEvent extends HomeEvent {

}

class HomePageChangeEvent extends HomeEvent{

  final int index;

  HomePageChangeEvent(this.index);

}

class SelectedImageEvent extends HomeEvent{
  final BuildContext context;

  SelectedImageEvent(this.context);
}

class PostImageEvent extends HomeEvent{
  final String uid;
  final String username;
  final String profileImage;
  final BuildContext context;

  PostImageEvent({required this.uid, required this.username, required this.profileImage, required this.context});
}

