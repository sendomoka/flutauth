import 'package:auth/screens/login_screen.dart';
import 'package:auth/screens/register_screen.dart';
import 'package:flutter/material.dart';

class ChooseAuthScreen extends StatefulWidget {
  const ChooseAuthScreen({super.key});

  @override
  State<ChooseAuthScreen> createState() => _ChooseAuthScreenState();
}

class _ChooseAuthScreenState extends State<ChooseAuthScreen> {
  bool isLogin = true;

  void changeAuth() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginScreen(onTap: changeAuth);
    } else {
      return RegisterScreen(onTap: changeAuth);
    }
  }
}
