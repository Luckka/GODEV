import 'dart:typed_data';

sealed class HomeState {
}

final class HomeStateInit extends HomeState {}

final class HomeChangePage extends HomeState{
  final int page;

  HomeChangePage({required this.page});
}