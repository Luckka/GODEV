import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_routes.dart';
import '../../../signup/presenter/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
        body: SafeArea(
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
            controller: _emailController,
            hintText: 'Enter your Email',
            keyboardType: TextInputType.emailAddress, validator: (value) {  },
          ),
          SizedBox(height: 24),
          TextFormFieldWidget(
            controller: _passwordController,
            hintText: 'Enter your Password',
            keyboardType: TextInputType.visiblePassword,
            isPass: true, validator: (value) {  },
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
    )));
  }
}
