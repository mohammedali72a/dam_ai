import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ProductTypeDropDownMenu extends StatelessWidget {
  final ArticleType article;
  final Function(ArticleType?) onChanged;
  final List<DropdownMenuItem<ArticleType>>? items;
  const ProductTypeDropDownMenu(
      {super.key,
      required this.onChanged,
      required this.items,
      required this.article});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: items,
          value: article,
          onChanged: onChanged,
          buttonHeight: 60,
          buttonWidth: double.maxFinite,
          buttonElevation: 2,
          iconSize: 30,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).cardColor,
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarAlwaysShow: true,
        ),
      ),
    );
  }
}
