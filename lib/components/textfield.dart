// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api
import 'package:flutter/material.dart';

class ATextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const ATextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  _ATextFieldState createState() => _ATextFieldState();
}

class _ATextFieldState extends State<ATextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    IconData prefixIcon;
    IconData? suffixIcon;

    if (widget.hintText == 'Email') {
      prefixIcon = Icons.email_outlined;
    } else if (widget.hintText == 'Password' || widget.hintText == 'Konfirmasi Password') {
      prefixIcon = Icons.lock_outline;
      suffixIcon = _obscureText ? Icons.visibility : Icons.visibility_off;
    } else {
      prefixIcon = Icons.person_outline;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white60,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[900],
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.white60,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white60,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: Colors.white60,
                  ),
                  onPressed: _toggleObscureText,
                )
              : null,
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
