import 'package:flutter/material.dart';

import '../../../data/models/article/article.dart';
import 'article_search_card.dart';

class DiscoverSection extends StatelessWidget {
  final List<Article> articlesList;
  const DiscoverSection({
    super.key,
    required this.articlesList,
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
          // InkWell(
          //   onTap: () {
          //     showSearch(
          //       context: context,
          //       delegate: CustomSearchClass(),
          //     );
          //   },
          //   child: SizedBox(
          //     height: 60,
          //     child: Card(
          //       elevation: 3,
          //       clipBehavior: Clip.hardEdge,
          //       color: Colors.grey[300],
          //       child: const Row(
          //         children: [
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Icon(
          //             Icons.search,
          //             color: Colors.black,
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             "البحث عن وضوع",
          //             style: TextStyle(fontSize: 18),
          //           ),
          //           Spacer(),
          //           // Container(
          //           //   height: double.infinity,
          //           //   width: 50,
          //           //   decoration: const BoxDecoration(
          //           //     color: Colors.black,
          //           //   ),
          //           //   child: const Icon(
          //           //     Icons.mic,
          //           //     color: Colors.white,
          //           //   ),
          //           // ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: articlesList.length,
            itemBuilder: (context, index) => ArticleSearchCard(
              article: articlesList[index],
            ),
          ),
        ],
      ),
    );
  }
}
