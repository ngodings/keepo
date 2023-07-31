import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keepo/screen/components/custom_button/custom_button.dart';
import 'package:keepo/screen/components/custom_loading.dart';
import 'package:keepo/screen/components/text/text_widget.dart';

class ExtendedImageWidget extends HookWidget {
  const ExtendedImageWidget({
    Key? key,
    required this.url,
    this.fit,
    this.disableFadeAnimation = true,
  }) : super(key: key);

  final String url;
  final BoxFit? fit;
  final bool disableFadeAnimation;

  @override
  Widget build(BuildContext context) {
    final _controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    )..repeat(reverse: true);
    return ExtendedImage.network(
      url,
      width: double.maxFinite,
      // height: ScreenUtil.instance.setWidth(400),
      fit: fit ?? BoxFit.cover,
      cache: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            _controller.reset();
            return const CustomLoading();
            break;
          case LoadState.completed:
            _controller.forward();
            if (disableFadeAnimation) {
              return ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                width: double.maxFinite,
                fit: fit ?? BoxFit.cover,
                // height: ScreenUtil.instance.setWidth(400),
              );
            }
            return FadeTransition(
              opacity: _controller,
              child: ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                width: double.maxFinite,
                fit: fit ?? BoxFit.cover,
                // height: ScreenUtil.instance.setWidth(400),
              ),
            );
            break;
          case LoadState.failed:
            _controller.reset();
            return CustomButton(
              child: const TextWidget(
                text: "load image failed, click to reload",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                state.reLoadImage();
              },
            );
            break;
        }
      },
    );
  }
}
