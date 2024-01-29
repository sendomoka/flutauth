import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;
  void letUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: letUserOut,
            icon: const Icon(Icons.logout, color: Colors.white)
          )
        ],
      ),
      body: Center(
        child: Text(
          'Mazuk sebagai: ${user!.email}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      )
    );
  }
}