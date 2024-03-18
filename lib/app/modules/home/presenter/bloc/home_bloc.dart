import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/core/shared/snack_bar_widget.dart';
import 'package:godev/app/modules/home/domain/usecase/delete_post_usecase.dart';
import 'package:godev/app/modules/home/domain/usecase/follow_user_usecase.dart';
import 'package:godev/app/modules/home/domain/usecase/post_comment_usecase.dart';
import 'package:godev/app/modules/home/domain/usecase/update_like_usecase.dart';
import 'package:godev/app/modules/home/domain/usecase/upload_post_usecase.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_event.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_state.dart';
import 'package:godev/app/modules/home/presenter/utils/navigation_tap.dart';
import 'package:godev/app/modules/signup/presenter/utils/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc({required this.uploadPostUseCase, required this.updateLikeUseCase,required this.postCommentUseCase, required this.deletePostUseCase, required this.followUserUseCase}) :super(HomeStateInit()){
    on<InitialEvent>(_init);
    on<HomePageChangeEvent>(_homePageChangeEvent);
    on<SelectedImageEvent>(_selectImage);
    on<PostImageEvent>(_postImage);
    on<UpdateLikeEvent>(_updateLike);
    on<PostCommentEvent>(_postComment);
    on<DeletePostEvent>(_deletePost);
    on<FollowUsersEvent>(_followUsers);
    on<SignOutEvent>(_signOut);

  }

  late PageController pageController;

  final UploadPostUseCase uploadPostUseCase;
  final UpdateLikeUseCase updateLikeUseCase;
  final PostCommentUseCase postCommentUseCase;
  final DeletePostUseCase deletePostUseCase;
  final FollowUserUseCase followUserUseCase;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int pageSelected = 0;
  Uint8List? file;
  final TextEditingController descriptionController = TextEditingController();

  void navigationTap(int page){
    pageController.jumpToPage(page);
  }



  Future<void> signOut()async{
    await _auth.signOut();
  }



  void _init(InitialEvent event, Emitter<HomeState> emit) async{



     emit(HomeStateInit());

         print('TESTE INIT');

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


              file = await pickImage(ImageSource.gallery);

              emit(SelectImageState(image: file!));



            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Cancel'),
            onPressed: () async{


              Navigator.of(context).pop();



            },
          ),

        ],

      );



    });



  }

  Future<void> _postImage(PostImageEvent event, Emitter<HomeState> emit) async{
    emit(LoadingPost());

    final result = await uploadPostUseCase.call(description: descriptionController.text, file: file!, uid: event.uid ?? '', username: event.username ?? '', profileImage: event.profileImage ?? '');

    result.fold(
        ifLeft: (l){
          showSnackBar(l.message, event.context);
        },
        ifRight: (r){
          file = null;
          showSnackBar('Success', event.context);
        });

    emit(HomeStateInit());

  }

  Future<void> _updateLike(UpdateLikeEvent event, Emitter<HomeState> emit) async{
    await updateLikeUseCase.call(postId: event.postId, uid: event.uid, likes: event.likes);
  }

  Future<void> _postComment(PostCommentEvent event, Emitter<HomeState> emit) async{
    await postCommentUseCase.call(postId: event.postId, text: event.text, uid: event.uid, name: event.name, profilePic: event.profilePic);
  }

  Future<void> _deletePost(DeletePostEvent event, Emitter<HomeState> emit) async{
    await deletePostUseCase.call(postId: event.postId);
  }

  Future<void> _followUsers(FollowUsersEvent event, Emitter<HomeState> emit) async{
    await followUserUseCase.call(uid: event.uid, followId: event.followId);
  }

  Future<void> _signOut(SignOutEvent event, Emitter<HomeState> emit) async{
    await signOut();
    Modular.to.navigate('/');
  }
}