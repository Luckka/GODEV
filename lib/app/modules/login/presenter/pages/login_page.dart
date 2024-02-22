import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_bloc.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_event.dart';
import 'package:godev/app/modules/login/presenter/bloc/login_state.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_routes.dart';
import '../../../signup/presenter/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  final loginBloc = Modular.get<LoginBloc>();
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _keyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => widget.loginBloc..add(InitialEvent()),
      child: Builder(builder: (context) => _buildPage(context),),

    );
  }


  @override
  void dispose() {
    super.dispose();
    widget.loginBloc.emailController.dispose();
    widget.loginBloc.passwordController.dispose();
  }

  @override
  Widget _buildPage(BuildContext context) {

    return Scaffold(
        body: BlocBuilder<LoginBloc,SignInState>(
          bloc: widget.loginBloc,
          builder: (context,state){
            return SafeArea(
                child: Form(
                  key: _keyLogin,
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
                        TextFormFieldWidget(
                          controller: widget.loginBloc.emailController,
                          hintText: 'Enter your Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter a email';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        TextFormFieldWidget(
                          controller: widget.loginBloc.passwordController,
                          hintText: 'Enter your Password',
                          keyboardType: TextInputType.visiblePassword,
                          isPass: true,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter a Password';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        InkWell(
                          onTap: () {
                            if(_keyLogin!.currentState!.validate()){
                              widget.loginBloc.add(LoginUserEvent(context));
                            }

                          },
                          child: state is LoginLoading ? const Center(child: CircularProgressIndicator()): Container(
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
                              onTap: () {
                                Modular.to.navigate(AppRoutes.signup);
                              },
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
                        const SizedBox(height: 12)
                      ],
                    ),
                  ),
                ));
          },
        )
    );
  }
}
