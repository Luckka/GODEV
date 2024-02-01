import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/login/domain/usecase/login_usecase.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_event.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(super.initialState, {required this.loginUseCase}){
    on<InitialEvent>(_init);
    on<SignUpEvent>(_signUp);

  }

  final LoginUseCase loginUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();


  void _init(InitialEvent event, Emitter<LoginState> emit) async{
      emit(state.clone());

  }

  Future<void> _signUp(SignUpEvent event, Emitter<LoginState> emit) async{
      final result = await loginUseCase.call(user: usernameController.text, password: passwordController.text, email: emailController.text, bio: bioController.text);

      return result;
  }
}