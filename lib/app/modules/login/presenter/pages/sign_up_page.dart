import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/core/app_colors.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';
import 'package:godev/app/modules/login/presenter/widgets/text_form_field_widget.dart';

import '../bloc/login_event.dart';

class SignUpPage extends StatefulWidget {
  final LoginBloc loginBloc;
  const SignUpPage({super.key, required this.loginBloc});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  

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
                  Flexible(
                    child: Container(),
                    flex: 1,
                  ),
                  Image.asset(
                    'assets/godev.png',
                  ),
                  const SizedBox(height: 64),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_1280.png'),
                      ),
                      Positioned(
                        bottom: -10,
                          left: 80,
                          child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo,color: Color(0Xff30B47B),),
                      ))
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextFormFieldWidget(
                    controller: widget.loginBloc.usernameController,
                    hintText: 'Enter your Username',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 24),
                  TextFormFieldWidget(
                    controller: widget.loginBloc.emailController,
                    hintText: 'Enter your Email',
                    keyboardType: TextInputType.emailAddress,
                    isPass: true,
                  ),
                  SizedBox(height: 24),
                  TextFormFieldWidget(
                    controller: widget.loginBloc.passwordController,
                    hintText: 'Enter your Password',
                    keyboardType: TextInputType.visiblePassword,
                    isPass: true,
                  ),
                  SizedBox(height: 24),
                  TextFormFieldWidget(
                    controller: widget.loginBloc.bioController,
                    hintText: 'Enter your bio',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 24),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.blueTitle,
                      ),
                      child: Text('Log in'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Don't have an account?"),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => widget.loginBloc.add(SignUpEvent()),
                        child: Container(
                          child: Text(
                            "Sign up.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ));
          }),
    );
  }
}
