import 'package:flutter/material.dart';

class AButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const AButton({
    Key? key,
    required this.text,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: text == 'Continue with Google' ? const Color.fromARGB(50, 255, 255, 255) : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (text == 'Continue with Google')
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'lib/images/google.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                Text(
                  text,
                  style: TextStyle(
                    color: text == 'Continue with Google' ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}