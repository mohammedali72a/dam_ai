import 'package:dam_ai/data/models/article/article.dart';
import 'package:dam_ai/data/repository/dummmy_data/dummy_data.dart';
import 'package:dam_ai/features/home/widgets/similar_section.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArticleDetails extends StatefulWidget {
  static const route = "article-details";
  final Article article;

  const ArticleDetails({super.key, required this.article});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
            "https://youtu.be/ELFORM9fmss?si=ihf_jZ9rNoZSyznK") ??
        '',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
  ScrollController scrollController = ScrollController();
  var scrolled = false;

  double appbarBottomHeight = 20;

  @override
  void initState() {
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
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                  YoutubePlayer(
                    controller: _controller,
                    // showVideoProgressIndicator: true,
                    // progressIndicatorColor: Colors.amber,
                    // progressColors: const ProgressBarColors(
                    //   playedColor: Colors.amber,
                    //   handleColor: Colors.amberAccent,
                    // ),
                    // onReady: () {
                    //   // _controller.addListener(() => ,);
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SimilarSection(
                    articlesList: dummyArticlesList,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
