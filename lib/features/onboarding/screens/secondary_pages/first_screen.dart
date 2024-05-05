import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 5),
                image: const DecorationImage(
                  repeat: ImageRepeat.repeat,
                  image: AssetImage(
                    "assets/animation/test.gif",
                  ),
                ),
              ),
            ),
          ),
          FadeInUp(
            child: const Text(
              "مرحبا بك في Dam Ai",
              style: TextStyle(
                color: Color(0xFFa3e6b6),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "منصة للتعرف علي الذكاء الاصطناعي في مجالات الطب والتعليم والتطبيقات العملية في جميع المجالات",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
