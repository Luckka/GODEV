import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_colors.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_bloc.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_state.dart';

import '../bloc/signup_event.dart';
import '../widgets/text_form_field_widget.dart';

class SignUpPage extends StatefulWidget {
  final signUpBloc = Modular.get<SignUpBloc>();
   SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => widget.signUpBloc..add(InitialEvent()),
      child: Builder(builder: (context) => _buildPage(context),),

    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<SignUpBloc, SignUpState>(
          bloc: widget.signUpBloc,
          builder: (context, state) {
            return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height,
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
                          controller: widget.signUpBloc.usernameController,
                          hintText: 'Enter your Username',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 24),
                        TextFormFieldWidget(
                          controller: widget.signUpBloc.emailController,
                          hintText: 'Enter your Email',
                          keyboardType: TextInputType.emailAddress,

                        ),
                        SizedBox(height: 24),
                        TextFormFieldWidget(
                          controller: widget.signUpBloc.passwordController,
                          hintText: 'Enter your Password',
                          keyboardType: TextInputType.visiblePassword,
                          isPass: true,
                        ),
                        SizedBox(height: 24),
                        TextFormFieldWidget(
                          controller: widget.signUpBloc.bioController,
                          hintText: 'Enter your bio',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 24),
                        InkWell(
                          onTap: () {
                            widget.signUpBloc.add(NewUserEvent());
                          },
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.blueTitle,
                            ),
                            child: Text('Sign Up'),
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
                              onTap: () {},
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
                  ),
                ));
          }),
    );
  }

}
