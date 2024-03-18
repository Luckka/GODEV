import 'dart:typed_data';

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
  final String? uid;
  final String? username;
  final String? profileImage;
  final BuildContext context;

  PostImageEvent({required this.uid, required this.username, required this.profileImage, required this.context,});
}

class UpdateLikeEvent extends HomeEvent{
  final String uid;
  final String postId;
  final List likes;

  UpdateLikeEvent({required this.uid, required this.postId, required this.likes});

}

class PostCommentEvent extends HomeEvent{
  final String postId;
  final String text;
  final String uid;
  final String name;
  final String profilePic;

  PostCommentEvent({required this.postId, required this.text, required this.uid, required this.name, required this.profilePic});
}

class DeletePostEvent extends HomeEvent{
  final String postId;

  DeletePostEvent({required this.postId});
}

class FollowUsersEvent extends HomeEvent{
  final String uid;
  final String followId;

  FollowUsersEvent({required this.uid, required this.followId});
}

class SignOutEvent extends HomeEvent{

}

