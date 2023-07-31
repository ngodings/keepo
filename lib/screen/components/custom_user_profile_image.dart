import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:keepo/utils/extensions.dart';
import 'package:keepo/utils/themes.dart';

class CustomUserProfileImage extends HookWidget {
  const CustomUserProfileImage({
    Key? key,
    required this.imgUrl,
    required this.username,
    this.width = 33,
    this.height = 33,
    this.radius = 10,
    this.gradient,
    this.shape = BoxShape.rectangle,
    this.useAutoKeepAlive = false,
    this.disableFadeAnimation = false,
  }) : super(key: key);
  final dynamic imgUrl;
  final String username;
  final double width, height;
  final double radius;
  final BoxShape shape;
  final List<Color>? gradient;
  final bool useAutoKeepAlive;
  final bool disableFadeAnimation;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive(wantKeepAlive: useAutoKeepAlive);
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    )..repeat(reverse: true);
    // print("IMG URL ==> ${jsonEncode(imgUrl)}");
    return SizedBox(
      width: width.sp,
      height: height.sp,
      child: imgUrl != null && imgUrl != ""
          ? imgUrl is File
              ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: gradient ?? topUpColor),
                    borderRadius: shape == BoxShape.circle
                        ? null
                        : BorderRadius.circular(radius),
                    shape: shape,
                    image: DecorationImage(
                      image: FileImage(imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : ExtendedImage.network(
                  imgUrl!,
                  fit: BoxFit.cover,
                  cache: true,
                  filterQuality: FilterQuality.none,
                  width: width.sp,
                  height: height.sp,
                  compressionRatio: 0.1,
                  maxBytes: null,
                  loadStateChanged: (ExtendedImageState state) {
                    switch (state.extendedImageLoadState) {
                      case LoadState.loading:
                        controller.reset();
                        return const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ).wh(width.sp / 3, height.sp / 3).centered();
                        break;
                      case LoadState.completed:
                        controller.forward();
                        if (disableFadeAnimation) {
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: gradient ?? topUpColor),
                              borderRadius: shape == BoxShape.circle
                                  ? null
                                  : BorderRadius.circular(radius),
                              shape: shape,
                              image: DecorationImage(
                                image: state.imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // child: ExtendedRawImage(
                            //   image: state.extendedImageInfo?.image,
                            //   fit: BoxFit.cover,
                            //   // width: ScreenUtil.instance.setWidth(600),
                            //   // height: ScreenUtil.instance.setWidth(400),
                            // ),
                          );
                        }
                        return FadeTransition(
                          opacity: controller,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: gradient ?? topUpColor),
                              borderRadius: shape == BoxShape.circle
                                  ? null
                                  : BorderRadius.circular(radius),
                              shape: shape,
                              image: DecorationImage(
                                image: state.imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // child: ExtendedRawImage(
                            //   image: state.extendedImageInfo?.image,
                            //   fit: BoxFit.cover,
                            //   // width: ScreenUtil.instance.setWidth(600),
                            //   // height: ScreenUtil.instance.setWidth(400),
                            // ),
                          ),
                        );
                        break;
                      case LoadState.failed:
                        controller.reset();
                        return buildInitialThumbnail();
                        break;
                    }
                  },
                )
          // CachedNetworkImage(
          //             imageUrl: imgUrl!,
          //             fit: BoxFit.cover,
          //             imageBuilder: (context, imageProvider) => Container(
          //               decoration: BoxDecoration(
          //                 gradient: LinearGradient(colors: gradient ?? topUpColor),
          //                 borderRadius: shape == BoxShape.circle
          //                     ? null
          //                     : BorderRadius.circular(radius),
          //                 shape: shape,
          //                 image: DecorationImage(
          //                   image: imageProvider,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //             ),
          //             placeholder: (context, url) {
          //               return const CircularProgressIndicator(
          //                 color: Colors.white,
          //                 strokeWidth: 2,
          //               ).centered().wh(12.sp, 12.sp);
          //             },
          //             errorWidget: (context, url, error) {
          //               // This was the reason for exception being triggered and rendered!
          //               // debugPrint(
          //               //     "IMAGE FAILED TO LOAD ==> $error"); // TODO: Remove this line!
          //               return buildInitialThumbnail();
          //             },
          //           ).centered()
          : buildInitialThumbnail(),
    );
  }

  Container buildInitialThumbnail() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient ?? topUpColor),
        borderRadius:
            shape == BoxShape.circle ? null : BorderRadius.circular(radius),
        shape: shape,
      ),
      child: StringService.getInitials(string: username)
          .text
          .white
          .bold
          .make()
          .centered(),
    );
  }
}
