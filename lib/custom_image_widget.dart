import 'package:flutter/material.dart';

import 'image_view.dart';

class MyImageWidget extends StatelessWidget {
  const new({required this.image, super.key});
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImageView(image: image)),
        );
      },
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}
