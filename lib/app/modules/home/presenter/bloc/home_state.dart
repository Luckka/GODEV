import 'dart:typed_data';

sealed class HomeState {
}

final class HomeStateInit extends HomeState {}

final class HomeChangePage extends HomeState{}