import 'package:flutter/material.dart';

class CustomSearchClass extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
// this will show clear query button
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
// adding a back button to close the search
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Placeholder();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text(
          "ابدأ البحث ",
          style: TextStyle(
            fontSize: 20,
            // color: ColorsManager.primaryColor,
          ),
        ),
      );
    } else {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.search),
                    onTap: () {
                      showResults(context);
                    },
                    title: Text(
                      query,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: products.length,
                  //   itemBuilder: (context, index) {
                  //     final product = products[index];

                  //     return ListTile(
                  //       leading: const Icon(Icons.search),
                  //       onTap: () {
                  //         query = product.title.toString();

                  //         showResults(context);
                  //       },
                  //       title: Text(
                  //         product.title,
                  //         style: const TextStyle(fontSize: 17),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
