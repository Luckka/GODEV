import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/signup/domain/usecase/signup_usecase.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_event.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  SignUpBloc(super.initialState, {required this.signUpUseCase}){
    on<InitialEvent>(_init);
    on<NewUserEvent>(_signUp);

  }

  final SignUpUseCase signUpUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();


  void _init(InitialEvent event, Emitter<SignUpState> emit) async{
      emit(state.clone());

  }

  Future<void> _signUp(NewUserEvent event, Emitter<SignUpState> emit) async{
      final result = await signUpUseCase.call(user: usernameController.text, password: passwordController.text, email: emailController.text, bio: bioController.text);

      return result;
  }
}