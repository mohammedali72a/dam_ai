import 'package:carousel_slider/carousel_slider.dart';
import 'package:dam_ai/features/home/widgets/aeticle_discover_card.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/dummmy_data/dummy_data.dart';

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "اكتشف",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          CarouselSlider(
            items: dummyArticlesList
                .map(
                  (article) => ArticleDiscoverCard(article: article),
                )
                .toList(),
            options: CarouselOptions(
              height: 200,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              onPageChanged: (index, reason) {},
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
