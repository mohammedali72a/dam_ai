import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utilis/constants/api_keys.dart';

class TextOnly extends StatefulWidget {
  const TextOnly({
    super.key,
  });

  @override
  State<TextOnly> createState() => _TextOnlyState();
}

class _TextOnlyState extends State<TextOnly> {
  bool loading = false;
  List textChat = [];
  List textWithImageChat = [];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  // Text only input
  Future<void> fromText({required String query}) async {
    setState(() {
      loading = true;
    });
    setState(() {
      textChat.add({
        "role": "User",
        "text": query,
      });

      _textController.clear();
    });
    scrollToTheEnd();

    await gemini.generateFromText(query).then((value) {
      setState(() {
        textChat.add({
          "role": "Gemini",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        textChat.add({
          "role": "Gemini",
          "text": error.toString(),
        });
      });
    });
  }

  void scrollToTheEnd() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 100),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        persistentFooterButtons: [
          Container(
            alignment: Alignment.bottomRight,
            // margin: const EdgeInsets.all(20).copyWith(top: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // border: Border.all(color: Colors.grey),
              color: Color.fromARGB(255, 99, 33, 126),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      hintStyle: TextStyle(color: Colors.white),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(30.0),
                      //     borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.transparent,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                IconButton(
                  icon: loading
                      ? const Icon(
                          Icons.pause_circle_outline_outlined,
                          size: 34,
                        )
                      : const Icon(Icons.send),
                  onPressed: () {
                    if (_textController.text.trim().isNotEmpty)
                      fromText(query: _textController.text.trim());
                  },
                ),
              ],
            ),
          )
        ],
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            child: Column(
              children: [
                if (textChat.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "مرحبا,كيف يمكنني مساعدتك",
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 32),
                              speed: Duration(milliseconds: 100),
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                        Hero(
                          tag: 'bot',
                          child: Lottie.asset(
                            'assets/animation/bot.json',
                          ),
                        )
                      ],
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: NeverScrollableScrollPhysics(),
                    // physics: ClampingScrollPhysics(),
                    // controller: _controller,
                    itemCount: textChat.length,
                    padding: const EdgeInsets.only(bottom: 70),
                    itemBuilder: (context, index) {
                      final message = textChat[index];
                      if (message["role"] == "User") {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                              child: Text(message["role"].substring(0, 1)),
                            ),
                            title: Text(message["role"]),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                    color: Color.fromARGB(255, 84, 27, 144),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        message["text"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      } else if (loading &&
                          textChat.indexOf(message) + 1 == textChat.length) {
                        return ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                              child: Lottie.asset(
                                'assets/animation/bot.json',
                              ),
                            ),
                            title: Text(message["role"]),
                            subtitle: AnimatedTextKit(
                              onNextBeforePause: (p0, p1) => scrollToTheEnd(),
                              onFinished: () => setState(() {
                                loading = false;
                              }),
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  message["text"],
                                  speed: Duration(milliseconds: 10),
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  // speed: Duration(milliseconds: 100),
                                ),
                              ],
                              totalRepeatCount: 1,
                            )
                            // : Text(textChat[index]["text"]),
                            );
                      } else {
                        return ListTile(
                          isThreeLine: true,
                          leading: CircleAvatar(
                            child: Lottie.asset(
                              'assets/animation/bot.json',
                            ),
                          ),
                          title: Text(message["role"]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                // clipBehavior: Clip.none,
                                color: Colors.grey[400],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    textChat[index]["text"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        ));
  }
}
