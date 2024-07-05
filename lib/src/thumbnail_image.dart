import 'package:flutter/material.dart';
import 'package:newsfeed_multiple_imageview/newsfeed_multiple_imageview.dart';
import 'package:newsfeed_multiple_imageview/src/smart_image.dart';

class ThumbnailImage extends StatelessWidget {
  const ThumbnailImage(
      {super.key,
      required this.imageUrls,
      required this.index,
      this.borderRadius});

  final List<String> imageUrls;
  final int index;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ImageViewer(imageUrls: imageUrls, index: index),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: SmartImage(
          imageUrls[index],
          fit: BoxFit.cover,
          isPost: true,
        ),
      ),
    );
  }
}
