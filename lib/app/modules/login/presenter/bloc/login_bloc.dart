import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_event.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(super.initialState){
    on<InitialEvent>(_init);
  }

  void _init(InitialEvent event, Emitter<LoginState> emit) async{
      emit(state.clone());

  }
}