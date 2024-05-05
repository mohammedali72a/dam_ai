import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondOnBoardingScreen extends StatefulWidget {
  const SecondOnBoardingScreen({super.key});

  @override
  _SecondOnBoardingScreenState createState() => _SecondOnBoardingScreenState();
}

class _SecondOnBoardingScreenState extends State<SecondOnBoardingScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: FadeInLeft(
              child: const Text(
                "اكتشف الذكاء الاصطناعي وتصفح المقالات",
                style: TextStyle(
                  color: Color(0xFFa3e6b6),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/animation/new.gif",
            ),
          ),
        ],
      ),
    );
  }
}
