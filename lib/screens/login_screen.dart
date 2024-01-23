import 'package:auth/components/button.dart';
import 'package:auth/components/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void letUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 100
                ),
                const SizedBox(height: 50),
                const Text(
                  'Ada yang kangen nih sama kamu🥰',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 25),
                ATextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                ATextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Lupa password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                const AButton(
                  text: 'Mazuk',
                  onTap: null
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white54,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Atau masuk dengan',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          color: Colors.white54,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const AButton(
                  text: 'Continue with Google',
                  onTap: null
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}