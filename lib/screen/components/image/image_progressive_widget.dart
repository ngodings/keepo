// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:gradient_borders/gradient_borders.dart';
// import 'package:keepo/utils/app_assets.dart';
// import 'package:keepo/utils/themes.dart';

// Widget buildProgressiveImage(
//   String? image, {
//   double? height,
//   double? width,
//   double? radius,
//   String? defaultImage,
//   bool? border,
// }) {
//   return image == null
//       ? Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: radius == null ? null : BorderRadius.circular(radius),
//             color: bluebg,
//             image: DecorationImage(
//               image: AssetImage(defaultImage ?? AppImages.defaultProfile),
//               onError: (exception, stackTrace) {
//                 throw exception;
//               },
//               fit: BoxFit.cover,
//             ),
//           ),
//         )
//       : ExtendedImage.network(
//           image,
//           height: height,
//           width: width,
//           fit: BoxFit.cover,
//           cache: true,
//           clearMemoryCacheWhenDispose: false,
//           filterQuality: FilterQuality.none,
//           compressionRatio: 0.1,
//           maxBytes: null,
//           loadStateChanged: (ExtendedImageState state) {
//             switch (state.extendedImageLoadState) {
//               case LoadState.loading:
//                 // _controller.reset();
//                 return Container(
//                   height: height,
//                   width: width,
//                   decoration: BoxDecoration(
//                     borderRadius:
//                         radius == null ? null : BorderRadius.circular(radius),
//                   ),
//                   child: const Center(
//                     child: CircularProgressIndicator(
//                         // value: state.,
//                         ),
//                   ),
//                 );
//                 break;
//               case LoadState.completed:
//                 // _controller.forward();
//                 return Stack(
//                   children: [
//                     Container(
//                       height: height,
//                       width: width,
//                       decoration: BoxDecoration(
//                         borderRadius: radius == null
//                             ? null
//                             : BorderRadius.circular(radius),
//                         border: border == true
//                             ? GradientBoxBorder(
//                                 gradient: LinearGradient(colors: goldenTwo))
//                             : null,
//                         image: DecorationImage(
//                           image: state.imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     FutureBuilder(
//                       future: Future.value(
//                         Future.delayed(const Duration(seconds: 2)),
//                       ),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState == ConnectionState.done) {
//                           return ExtendedImage.network(
//                             image,
//                             cache: true,
//                             loadStateChanged: (ExtendedImageState state2) {
//                               return Container(
//                                 height: height,
//                                 width: width,
//                                 decoration: BoxDecoration(
//                                   borderRadius: radius == null
//                                       ? null
//                                       : BorderRadius.circular(radius),
//                                   border: border == true
//                                       ? GradientBoxBorder(
//                                           gradient:
//                                               LinearGradient(colors: goldenTwo))
//                                       : null,
//                                   image: DecorationImage(
//                                     image: state2.imageProvider,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         } else {
//                           return Container();
//                         }
//                       },
//                     )
//                   ],
//                 );
//                 break;
//               case LoadState.failed:
//                 // _controller.reset();
//                 return Container(
//                   height: height,
//                   width: width,
//                   decoration: BoxDecoration(
//                     borderRadius:
//                         radius == null ? null : BorderRadius.circular(radius),
//                     image: const DecorationImage(
//                       image: AssetImage(AppImages.defaultProfile),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//                 break;
//             }
//           },
//         );
// }
