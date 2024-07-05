library newsfeed_multiple_imageview;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:newsfeed_multiple_imageview/src/multiple_image_view.dart';
import 'package:newsfeed_multiple_imageview/src/smart_image.dart';

class NewsfeedMultipleImageView extends StatelessWidget {
  final List<String> imageUrls;

  final EdgeInsets margin;
  final int maxImages = 5;

  const NewsfeedMultipleImageView({
    Key? key,
    this.margin = const EdgeInsets.all(0),
    required this.imageUrls,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, costraints) => Container(
        width: costraints.maxWidth,
        height: costraints.maxWidth,
        margin: margin,
        child: GestureDetector(
          child: MultipleImageView(imageUrls: imageUrls, maxImages: maxImages),
          onTap: () {
            if (kDebugMode) {
              print(
                  "Max Images: $maxImages / Image Urls Count: ${imageUrls.length}");
            }
            int _index = maxImages - 1;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ImageViewer(imageUrls: imageUrls, index: _index),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  final int index;

  const ImageViewer({
    Key? key,
    required this.imageUrls,
    required this.index,
  }) : super(key: key);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Expanded(
                child: ImageSlideshow(
                  initialPage: widget.index,
                  indicatorColor: Colors.red,
                  indicatorBackgroundColor: Colors.grey,
                  isLoop: widget.imageUrls.length > 1,
                  children: widget.imageUrls
                      .map(
                        (e) => ClipRect(
                          child: SmartImage(
                            e,
                            fit: BoxFit.contain,
                            isPost: true,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
