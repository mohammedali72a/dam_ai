import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/features/article_details/cubit/article_details_cubit.dart';
import 'package:dam_ai/features/home/widgets/similar_section.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArticleDetails extends StatefulWidget {
  static const route = "article-details";
  final Article article;

  const ArticleDetails({super.key, required this.article});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  List<YoutubePlayerController> _controllersList = [];
  ScrollController scrollController = ScrollController();
  var scrolled = false;

  double appbarBottomHeight = 20;

  @override
  void initState() {
    if (widget.article.youtubeUrl.isNotEmpty) {
      _controllersList = widget.article.youtubeUrl
          .map((url) => YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(url) ?? '',
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ))
          .toList();
    }
    scrollController.addListener(() {
      setState(() {
        scrolled = scrollController.offset > 200;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    for (final controller in _controllersList) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleDetailsCubit(widget.article),
      child: Scaffold(
        body: BlocBuilder<ArticleDetailsCubit, ArticleDetailsState>(
          builder: (context, state) {
            if (state is ArticleDetailsLoadinInProgress) {
              return const Padding(
                padding: EdgeInsets.only(top: 200),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            }
            if (state is ArticleDetailsLoadingSuccess) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 50,
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: scrolled ? 1 : 0,
                      child: Text(
                        widget.article.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    leading: AnimatedCrossFade(
                      crossFadeState: scrolled
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      firstChild: Container(
                        padding: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          color: Colors.black,
                        ),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      secondChild: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 5),
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            // color: ColorsManager.primaryColorDark,
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      Card(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_add_outlined,
                          ),
                        ),
                      ),
                    ],
                    backgroundColor: Colors.black,
                    pinned: true,
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      background: FancyShimmerImage(
                        imageUrl: widget.article.images.first,
                        boxFit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Card(
                                color: Colors.white.withOpacity(.3),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    widget.article.articleType.arabicValue,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.article.title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 2,
                            endIndent: 3,
                            indent: 3,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.article.content,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ..._controllersList.map(
                            (controller) => YoutubePlayer(
                              controller: controller,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (state.similarArticles.isNotEmpty)
                            SimilarSection(
                              articlesList: state.similarArticles,
                            ),
                        ],
                      ),
                    ),
                  )
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
    );
  }
}
