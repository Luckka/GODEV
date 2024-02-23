
import 'package:flutter/material.dart';
import 'package:godev/app/core/shared/user_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(UserDate.instance.user?.email ?? '',style: TextStyle(color: Colors.white),)),
    );
  }
}
