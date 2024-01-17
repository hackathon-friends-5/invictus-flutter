import 'package:development2/views/Authentication/login.dart';
import 'package:development2/views/BottomNav/bottomNav.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _preferences;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = _preferences.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Invictus',
          theme: ThemeData(
            fontFamily: 'Fira Sans',
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black,
              selectionHandleColor: Colors.black,
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedIn ? '/bottomNav' : '/login',
          getPages: [
            GetPage(name: '/bottomNav', page: () => const BottomNav()),
            GetPage(name: '/login', page: () => const Login()),
          ],
        );
      },
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            backgroundColor: const Color(0xffF3F5F7),
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              const StadiumBorder(),
              0.2,
            )!,
            width: 200,
            behavior: SnackBarBehavior.floating,
            content: const Text(
              'double tap to exit app',
              style: TextStyle(color: Color(0xff6cc51d)),
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 1),
          ),
          child: isLoggedIn ? const BottomNav() : const Login(),
        ),
      ),
    );
  }

  void setLoginStatus(bool value) {
    setState(() {
      isLoggedIn = value;
    });
    _preferences.setBool('isLoggedIn', value);
  }
}
