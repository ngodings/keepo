import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:keepo/features/components/base_page.dart';
import 'package:keepo/features/components/text/text_widget.dart';
import 'package:keepo/utils/app_assets.dart';

class ZoomedImage extends StatelessWidget {
  const ZoomedImage({Key? key, required this.image, required this.heroId})
      : super(key: key);
  final String image;
  final int heroId;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Stack(
        children: [
          PinchZoom(
            child: DismissiblePage(
              onDismissed: () {
                Navigator.of(context).pop();
              },
              direction: DismissiblePageDismissDirection.multi,
              isFullScreen: false,
              disabled: true,
              child: Hero(
                tag: heroId,
                child: image.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.contain,
                        errorWidget: (context, _, __) {
                          return const Center(
                            child: TextWidget(
                              text: "failed_load_image",
                            ),
                          );
                        },
                      )
                    : Image.asset(AppImages.defaultProfile),
              ),
            ),
          ),
          Positioned(
            top: 8.sp,
            right: 5.sp,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  size: 28.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
