import 'package:dam_ai/data/repository/dummmy_data/dummy_data.dart';
import 'package:dam_ai/features/chatbot/presentation/chatbot_screen.dart';
import 'package:dam_ai/features/chatbot/widgets/shimmer_text.dart';
import 'package:dam_ai/features/home/widgets/subjects_section.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/aeticle_discover_card.dart';
import '../widgets/discover_section.dart';
import '../widgets/search_section.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChatBotScreen(),
            ));
          },
          child: Lottie.asset(
            'assets/animation/bot.json',
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "D A M   AI",
          style: TextStyle(
            color: Color.fromARGB(255, 2, 211, 194),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_add))
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DiscoverSection(),
            const SubjectsSection(),
            const SizedBox(
              height: 10,
            ),
            SearchSection(
              articlesList: dummyArticlesList,
            ),
          ],
        ),
      ),
    );
  }
}
