import 'package:flutter/material.dart';
import 'package:photo_viewer/photo_viewer.dart';

class ImageView extends StatefulWidget {
  const new({super.key, required this.image});
  final String image;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhotoViewerImage(
        imageUrl: widget.image,
        showDefaultCloseButton: true,
      ),
    );
  }
}
