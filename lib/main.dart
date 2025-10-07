import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled4/feature/login/view/login_screen.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
      ),
      home: LoginScreen(),
    );
  }
}
