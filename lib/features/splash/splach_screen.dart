import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Center(
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText('Dam Ai',
                            textStyle: TextStyle(
                                color: Colors.yellow,
                                fontSize: 54,
                                fontWeight: FontWeight.bold),
                            speed: Duration(milliseconds: 100),
                            cursor: "",
                            curve: Curves.bounceIn),
                        // TypewriterAnimatedText(
                        //   'e',
                        //   textStyle:
                        //       TextStyle(color: Colors.white, fontSize: 24),
                        //   speed: Duration(milliseconds: 500),
                        // ),
                        // TypewriterAnimatedText(
                        //   't',
                        //   textStyle:
                        //       TextStyle(color: Colors.white, fontSize: 24),
                        //   speed: Duration(milliseconds: 500),
                        // ),
                        // TypewriterAnimatedText(
                        //   'f',
                        //   textStyle:
                        //       TextStyle(color: Colors.white, fontSize: 24),
                        //   speed: Duration(milliseconds: 500),
                        // ),
                        // TypewriterAnimatedText(
                        //   'l',
                        //   textStyle:
                        //       TextStyle(color: Colors.white, fontSize: 24),
                        //   speed: Duration(milliseconds: 500),
                        // ),
                        // TypewriterAnimatedText(
                        //   'i',
                        //   textStyle:
                        //       TextStyle(color: Colors.white, fontSize: 24),
                        //   speed: Duration(milliseconds: 500),
                        // ),
                        // TypewriterAnimatedText(
                        //   'x',
                        //   textStyle:
                        //       TextStyle(color: Colors.white, fontSize: 24),
                        //   speed: Duration(milliseconds: 500),
                        // ),
                      ],
                      // totalRepeatCount: 1,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20),
            // Text(
            //   'Netflix',
            //   style: TextStyle(color: Colors.white, fontSize: 24),
            // ),
          ],
        ),
      ),
    );
  }
}
