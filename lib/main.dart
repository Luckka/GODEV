import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:godev/app/responsive/mobile_screen_layout.dart';
import 'package:godev/app/responsive/responsive_layout_screen.dart';
import 'package:godev/app/responsive/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyBfrZiA6FWH2xeLnl1csZTKUBMI9ErbEcI',
            appId: "1:489380677784:web:fff7e874a0de559c20e8ed",
            messagingSenderId: "489380677784",
            storageBucket: "godev-c2277.appspot.com",
            projectId: "godev-c2277"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GODEV',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveLayout(
        webScreenLayout: WebScreenLayout(),
        mobileScreenLayout: MobileScreenLayout(),
      ),
    );
  }
}
