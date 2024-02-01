import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/core/app_colors.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';
import 'package:godev/app/modules/login/presenter/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc loginBloc;
  const LoginPage({super.key, required this.loginBloc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<LoginBloc, LoginState>(
          bloc: widget.loginBloc,
          builder: (context, state) {
            return SafeArea(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 1,),
                  Image.asset(
                    'assets/godev.png',
                  ),
                  const SizedBox(height: 64),
                  TextFormFieldWidget(
                      controller: _emailController,
                      hintText: 'Enter your Email',
                      keyboardType: TextInputType.emailAddress,
                      ),
                  SizedBox(height: 24),
                  TextFormFieldWidget(
                    controller: _passwordController,
                    hintText: 'Enter your Password',
                    keyboardType: TextInputType.visiblePassword,
                    isPass: true,
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.blueTitle,
                    ),
                    child: Text('Log in'),

                  ),

                  const SizedBox(height: 12),
                  Flexible(child: Container(), flex: 1,),
                ],
              ),
            ));
          }),
    );
  }
}
