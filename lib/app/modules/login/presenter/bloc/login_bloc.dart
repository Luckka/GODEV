import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/core/shared/snack_bar_widget.dart';
import 'package:godev/app/modules/login/domain/usecase/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<SignInEvent, SignInState>{
  LoginBloc(super.initialState,{required this.loginUseCase}){
    on<InitialEvent>(_init);
    on<LoginUserEvent>(_loginUserEvent);


  }


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginUseCase loginUseCase;


  void _init(InitialEvent event, Emitter<SignInState> emit) async{
    emit(state.clone());

  }



  Future<void> _loginUserEvent(LoginUserEvent event, Emitter<SignInState> emit) async{
    emit(LoginLoading());
    final result = await loginUseCase.call(email: emailController.text, password: passwordController.text);


    result.fold(
        ifLeft: (l){
          showSnackBar(l.message, event.context);
        },
        ifRight: (r){
          Modular.to.navigate(AppRoutes.home);
          return result;

        }
    );

    emit(SignInState());



  }
}