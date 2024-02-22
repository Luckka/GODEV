import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:godev/app/core/app_colors.dart';
import 'package:godev/app/core/app_routes.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_bloc.dart';
import 'package:godev/app/modules/signup/presenter/bloc/signup_state.dart';
import 'package:godev/app/core/shared/snack_bar_widget.dart';

import '../../external/signup_datasource_impl.dart';
import '../bloc/signup_event.dart';
import '../widgets/text_form_field_widget.dart';

class SignUpPage extends StatefulWidget {
  final signUpBloc = Modular.get<SignUpBloc>();
   SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

   final GlobalKey<FormState> _key = GlobalKey<FormState>();

    final SignUpDatasourceImpl signUpDatasourceImpl = SignUpDatasourceImpl();

  

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
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Modular.to.navigate('/');
        }),
      ),
      body: BlocBuilder<SignUpBloc, SignUpState>(
          bloc: widget.signUpBloc,
          builder: (context, state) {


            return SafeArea(

                child: SingleChildScrollView(

                  child: Container(
                    height: size.height,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    width: double.infinity,
                    child: Form(
                      key: _key,
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
                              state is PickImageState ?
                               CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(widget.signUpBloc.imageResult!),
                              ):
                              const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_1280.png'),
                              ),
                              Positioned(
                                  bottom: -10,
                                  left: 80,
                                  child: IconButton(
                                    onPressed: () {
                                      widget.signUpBloc.add(PickImageEvent());
                                    },
                                    icon: const Icon(Icons.add_a_photo,color: Color(0Xff30B47B),),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 24),
                          TextFormFieldWidget(
                            controller: widget.signUpBloc.usernameController,
                            hintText: 'Enter your Username',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Preencha seu Username';
                              }

                              return null;
                            },

                          ),
                          SizedBox(height: 24),
                          TextFormFieldWidget(
                            controller: widget.signUpBloc.emailController,
                            hintText: 'Enter your Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter a email';
                              }else if(!widget.signUpBloc.emailRegex.hasMatch(value)){
                                return 'Please enter a valid email address';
                              }

                              return null;
                            },

                          ),
                          SizedBox(height: 24),
                          TextFormFieldWidget(
                            controller: widget.signUpBloc.passwordController,
                            hintText: 'Enter your Password',
                            keyboardType: TextInputType.visiblePassword,
                            isPass: true,
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please Enter a Password';
                              }else if(value.length < 6){
                                return 'Please Enter a Valid Password';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 24),
                          TextFormFieldWidget(
                            controller: widget.signUpBloc.bioController,
                            hintText: 'Enter your bio',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter a bio';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 24),
                          InkWell(
                            onTap: () {

                               if(_key.currentState!.validate()){
                                widget.signUpBloc.add(NewUserEvent(context));

                              }



                            },
                            child: state is LoadingSignUpState ? const Center(child: CircularProgressIndicator()) :
                            Container(
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       child: Text("Don't have an account?"),
                          //       padding: const EdgeInsets.symmetric(vertical: 8),
                          //     ),
                          //     SizedBox(width: 5),
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: Container(
                          //         child: Text(
                          //           "Sign up.",
                          //           style: TextStyle(fontWeight: FontWeight.bold),
                          //         ),
                          //         padding: const EdgeInsets.symmetric(vertical: 8),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ));
          }),
    );
  }

}
