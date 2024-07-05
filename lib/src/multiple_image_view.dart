import 'package:flutter/material.dart';
import 'package:newsfeed_multiple_imageview/src/thumbnail_image.dart';

class MultipleImageView extends StatelessWidget {
  final List<String> imageUrls;
  final int maxImages;
  final double? radius = 0.0;

  const MultipleImageView({
    super.key,
    required this.imageUrls,
    required this.maxImages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _contentRender(),
    );
  }

  List<Widget> _contentRender() {
    switch (imageUrls.length) {
      case 1:
        return _singleImageView();

      case 2:
        return _twoImageView();

      case 3:
        return _threeImageView();

      case 4:
        return _fourImageView();
      // case 5:
      //   return _fiveImageView();
      default:
        return _multipleImageView();
    }
  }

  List<Widget> _singleImageView() {
    return [
      Expanded(
        flex: 1,
        child: ThumbnailImage(
          imageUrls: imageUrls,
          index: 0,
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
        ),
      ),
    ];
  }

  List<Widget> _twoImageView() {
    return [
      Expanded(
        flex: 1,
        child: ThumbnailImage(
          imageUrls: imageUrls,
          index: imageUrls.indexOf(imageUrls.first),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
      const SizedBox(width: 5),
      Expanded(
        flex: 1,
        child: ThumbnailImage(
          imageUrls: imageUrls,
          index: imageUrls.indexOf(imageUrls.last),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius!),
            bottomRight: Radius.circular(radius!),
          ),
        ),
      ),
    ];
  }

  List<Widget> _threeImageView() {
    return [
      Expanded(
          flex: 1,
          child: ThumbnailImage(
            imageUrls: imageUrls,
            index: 0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius!),
              bottomLeft: Radius.circular(radius!),
            ),
          )),
      const SizedBox(width: 5),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 1,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 2,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(radius!),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _fourImageView() {
    return [
      Expanded(
        flex: 2,
        child: ThumbnailImage(
          imageUrls: imageUrls,
          index: 0,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius!),
            bottomLeft: Radius.circular(radius!),
          ),
        ),
      ),
      const SizedBox(width: 5),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius!),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
                flex: 1, child: ThumbnailImage(imageUrls: imageUrls, index: 2)),
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 3,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(radius!)),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _multipleImageView() {
    return [
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius!),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius!),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 5),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 2,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius!),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: ThumbnailImage(
                imageUrls: imageUrls,
                index: 3,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  ThumbnailImage(
                    imageUrls: imageUrls,
                    index: 1,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(radius!),
                    ),
                  ),
                  Visibility(
                    visible: imageUrls.length > maxImages,
                    child: Positioned.fill(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(radius!),
                          ),
                        ),
                        child: Text(
                          '+${imageUrls.length - maxImages}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Nulito",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
