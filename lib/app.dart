import 'package:ewallet/views/card_screen.dart';
import 'package:ewallet/views/setting_screen.dart';
import 'package:ewallet/views/update_userdate_screen.dart';
import 'package:ewallet/views/withdraw_screen.dart';
import 'package:ewallet/views/login_screen.dart';
import 'package:ewallet/views/main_screen.dart';
import 'package:ewallet/views/signup_screen.dart';
import 'package:ewallet/views/verified_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: {
        "loginScreen": (context) => const LoginScreen(),
        "signupScreen": (context) => const SignupScreen(),
        "verifiedScreen": (context) => const VerifiedScreen(),
        "mainScreen": (context) => const MainScreen(),
        "cardScreen": (context) => const CardScreen(),
        "pushScreen": (context) => const WithdrawScreen(),
        "updateDataScreen": (context) => const UpdateUserDataScreen(),
      },
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.blueAccent,
              selectedIconTheme: IconThemeData(
                size: 30,
              ),
              selectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              unselectedItemColor: Colors.black,
              unselectedIconTheme: IconThemeData(
                size: 20,
              ),
              unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
      ),
    );
  }
}
