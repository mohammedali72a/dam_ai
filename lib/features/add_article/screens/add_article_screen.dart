import 'dart:io';

import 'package:dam_ai/data/models/article/article_type.dart';
import 'package:dam_ai/features/home/cubit/article_cubit.dart';
import 'package:dam_ai/features/add_article/widgets/editable_image_list.dart';
import 'package:dam_ai/features/add_article/widgets/product_type_dropdown.dart';
import 'package:dam_ai/features/home/presentaion/scrrens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController videoLinkController = TextEditingController();
  final List<File> selectedImages = [];
  bool isHeader = false;
  final List<String> youtubeUrls = [];
  ArticleType articleType = ArticleType.duUniversity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضف مقالة"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "صور الطلب",
                ),
                const SizedBox(height: 20),
                EditableImagesList(
                  onDelete: (images) {
                    setState(() {
                      selectedImages.remove(images);
                    });
                  },
                  onAdd: (images) {
                    setState(() {
                      selectedImages.addAll(images);
                    });
                  },
                  images: selectedImages,
                ),
                const SizedBox(
                  height: 20,
                ),
                ProductTypeDropDownMenu(
                  onChanged: (product) {
                    setState(() {
                      if (product != null) articleType = product;
                    });
                  },
                  article: articleType!,
                  items: ArticleType.values
                      .map((product) => DropdownMenuItem<ArticleType>(
                            value: product,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                product.arabicValue,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "اضف عنوان",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "يرجي تحديد عنوان";
                    }
                    if (value.trim().isEmpty) {
                      return "يرجي تحديد عنوان";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "اضف التفاصيل",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "يرجي تحديد التفاصيل";
                    }
                    if (value.trim().isEmpty) {
                      return "يرجي تحديد التفاصيل";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: videoLinkController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "رابط اليوتيوب",
                    suffix: ElevatedButton(
                        onPressed: () {
                          if (videoLinkController.text.trim().isNotEmpty) {
                            setState(() {
                              youtubeUrls.add(videoLinkController.text.trim());
                              videoLinkController.clear();
                            });
                          }
                        },
                        child: const Text("اضاقة")),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  // validator: (value) {
                  //   if (value == null) {
                  //     return "يجب تحديد رابط اليوتيوب";
                  //   }
                  //   if (value.isEmpty) {
                  //     return "يجب تحديد رابط اليوتيوب";
                  //   }

                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 20,
                ),
                if (youtubeUrls.isNotEmpty)
                  const Text(
                    "الروابط",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ...youtubeUrls.map(
                  (e) => Text(
                    '$e .${youtubeUrls.indexOf(e) + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isHeader,
                      onChanged: (value) {
                        setState(() {
                          isHeader = !isHeader;
                        });
                      },
                    ),
                    const Text(
                      "موضوع رئيسي",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        final state =
                            BlocProvider.of<ArticleCubit>(context).state;
                        if (!_formKey.currentState!.validate() ||
                            state is AddArticleLoadingInProgress ||
                            selectedImages.isEmpty) {
                          return;
                        } else if (state is AddArticleLoadingSuccess) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) {
                                return const HomeScreen();
                              },
                            ),
                            (route) => false,
                          );
                        }
                        BlocProvider.of<ArticleCubit>(context).addArtiicle(
                          title: titleController.text.trim(),
                          youtubeUrl: youtubeUrls,
                          content: descriptionController.text.trim(),
                          images: selectedImages,
                          articleType: articleType,
                          isHeader: isHeader,
                        );
                      },
                      style: ElevatedButton.styleFrom(),
                      child: BlocBuilder<ArticleCubit, ArticleState>(
                        builder: (context, state) {
                          if (state is AddArticleLoadingInProgress) {
                            return const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            );
                          }
                          return const Text(
                            "اضف المقالة",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
