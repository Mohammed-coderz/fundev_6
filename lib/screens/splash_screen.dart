import 'package:flutter/material.dart';
import 'package:untitled4/screens/home_screen.dart';

import '../core/const/png.dart';
import '../core/utils/shared_preferences_helper.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goTo();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Image.asset(
          PNGs.logo,
          width: width * 1,
          height: height * 0.3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  goTo() async {
    bool loggedIn = await SharedPreferencesHelper.getBool("remember") ?? false;

    if (loggedIn != true) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    }
  }
}
