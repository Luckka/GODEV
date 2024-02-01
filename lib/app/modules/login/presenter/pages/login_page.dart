import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc loginBloc;
  const LoginPage({super.key, required this.loginBloc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: BlocBuilder<LoginBloc, LoginState>(
          bloc: widget.loginBloc,
          builder: (context, state) {
            return SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/godev.png',
                ),
                const SizedBox(height: 64),
              ],
            ));
          }),
    );
  }
}
