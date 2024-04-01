import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../widgets/shimmer_text.dart';
import '../widgets/text_only_tab.dart';
import '../widgets/text_with_image_tab.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({
    super.key,
  });

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            tabs: [
              Tab(text: "ChatBot"),
              Tab(text: "Image Recognition"),
            ],
          ),
          title: AnimatedShimmer(
            duration: const Duration(milliseconds: 2000),
            delay: const Duration(milliseconds: 1000),
            child: RichText(
              text: const TextSpan(
                text: 'Build with ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Color(0xFF4588F1),
                  fontSize: 24,
                ),
                children: [
                  TextSpan(
                    text: 'Gemini',
                  )
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TextOnly(),
            TextWithImage(),
          ],
        ),
      ),
    );
  }
}
