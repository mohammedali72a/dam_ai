import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utilis/constants/api_keys.dart';

class TextWithImage extends StatefulWidget {
  const TextWithImage({
    super.key,
  });

  @override
  State<TextWithImage> createState() => _TextWithImageState();
}

class _TextWithImageState extends State<TextWithImage> {
  bool loading = false;
  List textAndImageChat = [];
  List textWithImageChat = [];
  File? imageFile;

  final ImagePicker picker = ImagePicker();

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  // Text only input
  void fromTextAndImage({required String query, required File image}) {
    setState(() {
      loading = true;
      textAndImageChat.add({
        "role": "User",
        "text": query,
        "image": image,
      });
      _textController.clear();
      imageFile = null;
    });
    scrollToTheEnd();

    gemini.generateFromTextAndImages(query: query, image: image).then((value) {
      setState(() {
        textAndImageChat
            .add({"role": "Gemini", "text": value.text, "image": ""});
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        textAndImageChat
            .add({"role": "Gemini", "text": error.toString(), "image": ""});
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          floatingActionButton: imageFile != null
              ? Container(
                  margin: const EdgeInsets.only(bottom: 80),
                  height: 150,
                  child: Image.file(imageFile ?? File("")),
                )
              : null,
          persistentFooterButtons: [
            Container(
              alignment: Alignment.bottomRight,
              // margin: const EdgeInsets.all(20).copyWith(top: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // border: Border.all(color: Colors.grey),
                color: const Color.fromARGB(255, 99, 33, 126),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Write a message",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        fillColor: Colors.transparent,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: () async {
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        imageFile = image != null ? File(image.path) : null;
                      });
                    },
                  ),
                  IconButton(
                    icon: loading
                        ? const Icon(
                            Icons.pause_circle_outline_outlined,
                            size: 34,
                          )
                        : const Icon(Icons.send),
                    onPressed: () {
                      if (imageFile == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please select an image")));
                        return;
                      }
                      fromTextAndImage(
                          query: _textController.text, image: imageFile!);
                    },
                  ),
                ],
              ),
            ),
          ],
          body: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            child: Column(
              children: [
                if (textAndImageChat.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              textAlign: TextAlign.center,
                              "مرحبا,كيف يمكنني مساعدتك",
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 32),
                              speed: const Duration(milliseconds: 100),
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
                    physics: const NeverScrollableScrollPhysics(),
                    // physics: ClampingScrollPhysics(),
                    // controller: _controller,
                    itemCount: textAndImageChat.length,
                    padding: const EdgeInsets.only(bottom: 70),
                    itemBuilder: (context, index) {
                      final message = textAndImageChat[index];
                      if (message["role"] == "User") {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            isThreeLine: true,
                            trailing: textAndImageChat[index]["image"] == ""
                                ? null
                                : Image.file(
                                    textAndImageChat[index]["image"],
                                    width: 90,
                                  ),
                            leading: CircleAvatar(
                              child: Text(message["role"].substring(0, 1)),
                            ),
                            title: Text(message["role"]),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                    color:
                                        const Color.fromARGB(255, 84, 27, 144),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        message["text"],
                                        style: const TextStyle(
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
                          textAndImageChat.indexOf(message) + 1 ==
                              textAndImageChat.length) {
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
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
                                    message["text"],
                                    style: const TextStyle(
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
          )
          // body: Column(
          //   children: [
          //     Expanded(
          //       child: ListView.builder(
          //         controller: _controller,
          //         itemCount: textAndImageChat.length,
          //         padding: const EdgeInsets.only(bottom: 20),
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             isThreeLine: true,
          //             leading: CircleAvatar(
          //               child:
          //                   Text(textAndImageChat[index]["role"].substring(0, 1)),
          //             ),
          //             title: Text(textAndImageChat[index]["role"]),
          //             subtitle: Text(textAndImageChat[index]["text"]),
          // trailing: textAndImageChat[index]["image"] == ""
          //     ? null
          //     : Image.file(
          //         textAndImageChat[index]["image"],
          //         width: 90,
          //       ),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),

          ),
    );
  }
}
