import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // login();
    super.initState();
  }

  // void login() {
  //   if (SharedPreferencesHelper.getIsLoggedIn()) {
  //     Timer(const Duration(seconds: 2), () {
  //       Navigator.pop(context);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => BottomNav(),
  //         ),
  //       );
  //     });
  //   } else if (!SharedPreferencesHelper.getIsLoggedIn()) {
  //     Timer(const Duration(seconds: 2), () {
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (context) => const Login()),
  //           (Route<dynamic> route) => false);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.black),
        child: const Image(
            width: 150, height: 130, image: AssetImage('assets/splash.png')),
      ),
    );
  }
}
