// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:auth/components/button.dart';
import 'package:auth/components/textfield.dart';
import 'package:auth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void letUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-email') {
        authMessage('Akun tidak ditemukan!');
      } else if (e.code == 'invalid-credential') {
        authMessage('Email atau password salah!');
      }
    }
  }

  void authMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login gagal', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            content: Text(message, style: TextStyle(color: Colors.white, fontSize: 18)),
            backgroundColor: Colors.grey[900],
            actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Add horizontal padding
                        child: Text('OK', style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                ),
              ],
          );
        }
    );
  }  

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
                  const Icon(Icons.auto_awesome,
                      color: Colors.white, size: 100),
                  const SizedBox(height: 50),
                  const Text(
                    'Ada yang kangen nih sama kamu🥰',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  AButton(
                      text: 'Mazuk',
                      onTap: () async {
                        letUserIn();
                      }),
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
                          style: TextStyle(color: Colors.white54, fontSize: 16),
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
                  AButton(
                    text: 'Continue with Google',
                    onTap: () => AuthService().signInWithGoogle(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum punya akun? ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Bikin Akun',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
