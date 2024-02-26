import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_event.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_state.dart';
import 'package:godev/app/modules/home/presenter/utils/navigation_tap.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() :super(HomeStateInit()){
    on<InitialEvent>(_init);
    on<HomePageChangeEvent>(_homePageChangeEvent);
  }

  late PageController pageController;

  int pageSelected = 0;

  void navigationTap(int page){
    pageController.jumpToPage(page);
  }

  // void onPageChanged(int page){
  //
  //   pageSelected = page;
  //
  //   add(HomePageChangeEvent(pageSelected));
  //
  //
  // }



  void _init(InitialEvent event, Emitter<HomeState> emit) async{

     emit(HomeStateInit());

     pageController = PageController();






  }

  Future<void> _homePageChangeEvent(HomePageChangeEvent event, Emitter<HomeState> emit) async{
    emit(HomeChangePage(page: event.index));
    //onPageChanged(event.index);

  }
}