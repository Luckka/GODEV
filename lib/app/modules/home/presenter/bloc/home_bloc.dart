import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_event.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_state.dart';
import 'package:godev/app/modules/home/presenter/utils/navigation_tap.dart';
import 'package:godev/app/modules/signup/presenter/utils/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() :super(HomeStateInit()){
    on<InitialEvent>(_init);
    on<HomePageChangeEvent>(_homePageChangeEvent);
    on<SelectedImageEvent>(_selectImage);
  }

  late PageController pageController;

  int pageSelected = 0;
  Uint8List? file;

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

  // void _selectImage(BuildContext context) async{

  // }

  Future<void> _homePageChangeEvent(HomePageChangeEvent event, Emitter<HomeState> emit) async{
    emit(HomeChangePage(page: event.index));
    //onPageChanged(event.index);

  }

  Future<void> _selectImage(SelectedImageEvent event, Emitter<HomeState> emit) async{
    return showDialog(context: event.context, builder: (context) {
      return SimpleDialog(
        title: const Text('Create a Post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a Photo'),
            onPressed: () async{

              Navigator.of(context).pop();
              file = await pickImage(ImageSource.camera);
              emit(SelectImageState(image: file!));


            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from Gallery'),
            onPressed: () async{

              Navigator.of(context).pop();
              file = await pickImage(ImageSource.gallery);
              emit(SelectImageState(image: file!));


            },
          ),

        ],

      );



    });



  }
}