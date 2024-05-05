import 'package:dam_ai/features/add_article/screens/add_article_screen.dart';
import 'package:dam_ai/features/chatbot/presentation/chatbot_screen.dart';
import 'package:dam_ai/features/chatbot/widgets/shimmer_text.dart';
import 'package:dam_ai/features/home/cubit/article_cubit.dart';
import 'package:dam_ai/features/home/presentaion/scrrens/team_members_screen.dart';
import 'package:dam_ai/features/home/widgets/subjects_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/discover_section.dart';
import '../../widgets/search_section.dart';

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
        title: AnimatedShimmer(
          duration: const Duration(milliseconds: 2000),
          delay: const Duration(milliseconds: 1000),
          baseColor: const Color.fromARGB(255, 8, 172, 126),
          highlightColor: const Color.fromARGB(255, 0, 225, 255),
          child: const Text(
            "D A M   AI",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Color(0xFF4588F1),
              fontSize: 30,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(top: 50),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
              ),
              AnimatedShimmer(
                duration: const Duration(milliseconds: 2000),
                delay: const Duration(milliseconds: 1000),
                baseColor: const Color.fromARGB(255, 8, 172, 126),
                highlightColor: const Color.fromARGB(255, 0, 225, 255),
                child: const Text(
                  "D A M   AI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Color(0xFF4588F1),
                    fontSize: 30,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TeamMembersScreen(),
                  ));
                },
                icon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 8, 172, 126),
                ),
                label: const Text(
                  "أعضاء الفريق",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 225, 255),
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddProductScreen(),
                    ));
                  },
                  child: const Text(
                    "اضف مقالة",
                    style: TextStyle(
                      color: Color.fromARGB(255, 215, 170, 47),
                      fontSize: 22,
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ArticleCubit>(context).intial();
        },
        child: SingleChildScrollView(
          child: BlocBuilder<ArticleCubit, ArticleState>(
            builder: (context, state) {
              if (state is ArticlesLoadingInprogress) {
                return const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              }
              if (state is ArticleLoadingSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopArticlesSection(
                      discoverArticles: state.discoverArticlelist,
                    ),
                    SubjectsSection(
                      articleList: state.articlelist,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DiscoverSection(
                      articlesList: state.articlelist,
                    ),
                  ],
                );
              }
              return const Padding(
                padding: EdgeInsets.only(top: 200),
                child: Center(
                  child: Text(
                    "حدث خطأ في التحميل",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF7A5034),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
