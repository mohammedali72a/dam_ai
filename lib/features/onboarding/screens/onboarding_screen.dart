import 'package:dam_ai/features/home/presentaion/scrrens/home_screen.dart';
import 'package:dam_ai/features/onboarding/screens/secondary_pages/first_screen.dart';
import 'package:dam_ai/features/onboarding/screens/secondary_pages/second_screen.dart';
import 'package:dam_ai/features/onboarding/screens/secondary_pages/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const route = "/onboarding-screen";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  bool _isLastPage = false;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const FirstOnBoardingScreen(),
      const SecondOnBoardingScreen(),
      const ThirdScreen(),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: pages,
                onPageChanged: (value) {
                  if (value == 2) {
                    setState(() {
                      _isLastPage = true;
                    });
                  }
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: const ScrollingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Color(0xFF6ca284),
                fixedCenter: true,
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  if (_isLastPage) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false);
                  }
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
                child: Center(
                  child: Text(
                    _isLastPage ? "ابدأ رحلتك" : "التالي",
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
