import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/signup/domain/usecase/signup_usecase.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_event.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_state.dart';
import 'package:godev/app/modules/signup/presenter/utils/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  SignUpBloc(super.initialState, {required this.signUpUseCase}){
    on<InitialEvent>(_init);
    on<NewUserEvent>(_signUp);
    on<PickImageEvent>(_pickImage);

  }

  final SignUpUseCase signUpUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  Uint8List? imageResult;


  void _init(InitialEvent event, Emitter<SignUpState> emit) async{
      emit(state.clone());

  }

  Future<void> _signUp(NewUserEvent event, Emitter<SignUpState> emit) async{
      final result = await signUpUseCase.call(user: usernameController.text, password: passwordController.text, email: emailController.text, bio: bioController.text, file: imageResult!);

      return result;
  }

  Future<void> _pickImage(PickImageEvent event, Emitter<SignUpState> emit) async{

    imageResult = await pickImage(ImageSource.gallery);

    emit(PickImageState(image: imageResult!));


  }
}