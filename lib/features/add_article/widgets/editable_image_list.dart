import 'dart:io';

import 'package:dam_ai/features/add_article/widgets/confirmation_dialog.dart';
import 'package:dam_ai/features/add_article/widgets/pick_image_daialpg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

class EditableImagesList extends StatefulWidget {
  final Function(List<File> images) onAdd;
  final Function(List<File> images) onDelete;
  final List<File> images;

  const EditableImagesList({
    super.key,
    required this.images,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  State<EditableImagesList> createState() => _EditableImagesListState();
}

class _EditableImagesListState extends State<EditableImagesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -20,
            right: -20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    ...widget.images
                        .mapIndexed(
                          (index, image) => Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Material(
                              elevation: 3,
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      final delete = await showDialog(
                                        context: context,
                                        builder: (_) =>
                                            const ConfirmationDialog(
                                          message: "أتريد حذف الصورة؟",
                                        ),
                                      );

                                      if (delete is bool && delete) {
                                        widget.images.removeAt(index);
                                      }
                                      widget.onDelete(widget.images);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    SizedBox.square(
                      dimension: 150,
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            final images = await showDialog(
                              context: context,
                              builder: (context) {
                                return const PickImageDialog();
                              },
                            );
                            if (images is List<File> && images.isNotEmpty) {
                              widget.onAdd(images);
                            }
                          },
                          child: DottedBorder(
                            strokeWidth: 2,
                            strokeCap: StrokeCap.round,
                            borderPadding: const EdgeInsets.all(1),
                            color: Colors.grey,
                            radius: const Radius.circular(
                              10,
                            ),
                            dashPattern: const [10, 10],
                            borderType: BorderType.RRect,
                            child: const Center(
                              child: Icon(
                                Icons.add_photo_alternate,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
