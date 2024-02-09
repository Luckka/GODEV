import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<SignInEvent, SignInState>{
  LoginBloc(super.initialState){
    on<InitialEvent>(_init);


  }


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();


  void _init(InitialEvent event, Emitter<SignInState> emit) async{
    emit(state.clone());

  }


}