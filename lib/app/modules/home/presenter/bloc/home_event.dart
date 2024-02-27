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

