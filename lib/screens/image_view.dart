import 'package:first_project/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_viewer/photo_viewer.dart';

class ImageView extends StatefulWidget {
  const new({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as List;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            PhotoViewerImage(
              imageUrl: arg[1].toString(),
              showDefaultCloseButton: true,
            ),
            Hero(
              curve: Curves.easeInOut,
              tag: arg[1].toString(),
              child: Text(arg[0].toString()),
            ),
          ],
        ),
      ),
    );
  }
}
