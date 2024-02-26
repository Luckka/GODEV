abstract class HomeEvent{

}

class InitialEvent extends HomeEvent {

}

class HomePageChangeEvent extends HomeEvent{

  final int index;

  HomePageChangeEvent(this.index);

}

