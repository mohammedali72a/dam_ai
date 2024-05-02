import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Lottie.asset("assets/animation/done.json", repeat: false),
        ),
        const Text(
          "اكتشف الان !",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFa3e6b6),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
