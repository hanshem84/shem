import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;
  final BoxFit boxFit;

  const DefaultImageWidget({super.key, required this.imageUrl, required this.width, required this.height, required this.radius, required this.boxFit});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        width: width.w,
        height: height.w,
        fadeInDuration: Duration(milliseconds: 300),
        fadeOutDuration: Duration(milliseconds: 300),
        placeholderFadeInDuration: Duration(milliseconds: 300),
        errorWidget: (context, url, error) {
          return Container(
            color: Colors.grey[100],
            child: Center(child: Text("No Image")),
          );
        },
        placeholder: (context, url) {
          return Container(
            color: Colors.grey[100],
            // child: Center(
            //   child: CircularProgressIndicator(
            //     color: Colors.grey,
            //     strokeWidth: 1,
            //     backgroundColor: Colors.grey[200],
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
