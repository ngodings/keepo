import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:keepo/utils/app_assets.dart';
import 'package:keepo/utils/themes.dart';

class ImageProgressive extends StatelessWidget {
  const ImageProgressive({
    super.key,
    this.image,
    this.height,
    this.width,
    this.radius,
    this.defaultImage,
    this.border,
    this.foregroundFrame,
    this.compressionRatio,
  });
  final String? image;
  final double? height;
  final double? width;
  final double? radius;
  final String? defaultImage;
  final bool? border;
  final bool? foregroundFrame;
  final double? compressionRatio;
  @override
  Widget build(BuildContext context) {
    //Frame
    BoxDecoration? foregroundFrameWidget = foregroundFrame != true
        ? null
        : BoxDecoration(
            borderRadius:
                radius == null ? null : BorderRadius.circular(radius!),
            gradient: LinearGradient(
              colors: [
                CustomColor.background.withOpacity(0.8),
                Colors.transparent,
                Colors.transparent,
                CustomColor.background.withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          );
    //build
    return image == null
        ? Image.asset(
            AppImages.defaultProfile,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Container(
                height: height,
                width: width,
                foregroundDecoration: foregroundFrameWidget,
                child: radius == null
                    ? child
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(radius!),
                        child: child,
                      ),
              );
            },
          )
        : ExtendedImage.network(
            image!,
            height: height,
            width: width,
            fit: BoxFit.cover,
            cache: true,
            clearMemoryCacheWhenDispose: false,
            filterQuality: FilterQuality.none,
            compressionRatio: compressionRatio,
            maxBytes: null,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  // _controller.reset();
                  return Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: radius == null
                          ? null
                          : BorderRadius.circular(radius!),
                    ),
                    foregroundDecoration: foregroundFrameWidget,
                    child: const Center(
                      child: CircularProgressIndicator(
                          // value: state.,
                          ),
                    ),
                  );
                  break;
                case LoadState.completed:
                  // _controller.forward();
                  return Stack(
                    children: [
                      Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: radius == null
                              ? null
                              : BorderRadius.circular(radius!),
                          border: border == true
                              ? GradientBoxBorder(
                                  gradient: LinearGradient(colors: goldenTwo))
                              : null,
                          image: DecorationImage(
                            image: state.imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: foregroundFrameWidget,
                      ),
                      // FutureBuilder(
                      //   future: Future.value(
                      //     Future.delayed(const Duration(seconds: 2)),
                      //   ),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.done) {
                      //       return ExtendedImage.network(
                      //         image!,
                      //         cache: true,
                      //         loadStateChanged: (ExtendedImageState state2) {
                      //           return Container(
                      //             height: height,
                      //             width: width,
                      //             decoration: BoxDecoration(
                      //               borderRadius: radius == null
                      //                   ? null
                      //                   : BorderRadius.circular(radius!),
                      //               border: border == true
                      //                   ? GradientBoxBorder(
                      //                       gradient: LinearGradient(
                      //                           colors: goldenTwo))
                      //                   : null,
                      //               image: DecorationImage(
                      //                 image: state2.imageProvider,
                      //                 fit: BoxFit.cover,
                      //               ),
                      //             ),
                      //             foregroundDecoration: foregroundFrameWidget,
                      //           );
                      //         },
                      //       );
                      //     } else {
                      //       return Container();
                      //     }
                      //   },
                      // ),
                    ],
                  );
                  break;
                case LoadState.failed:
                  // _controller.reset();
                  return Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: radius == null
                          ? null
                          : BorderRadius.circular(radius!),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.defaultProfile),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: foregroundFrameWidget,
                  );
                  break;
              }
            },
          );
  }
}
