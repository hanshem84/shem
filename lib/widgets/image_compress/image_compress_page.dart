import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shem/utils/secureStorage/secure_storage_init.dart';
import 'package:shem/utils/val/color.dart';
import 'package:shem/widgets/image_compress/controller/image_compress_controller.dart';
import 'package:shem/widgets/system_overlay.dart';

class ImageCompressWidget extends StatelessWidget {
  final String imageUrl;
  final BoxFit boxFit;

  const ImageCompressWidget({super.key, required this.imageUrl, required this.boxFit});

  @override
  Widget build(BuildContext context) {
    ImageCompressController controller = Get.put(ImageCompressController(imageUrl: imageUrl), tag: imageUrl);
    return SystemOverLayWidget(
      backgroundColor: white,
      statusDarkMode: false,
      safeAreaTop: true,
      safeAreaBottom: true,
      scaffoldColor: white,
      child: Obx(() {
        return controller.isCompImage.value
            ? Stack(
                children: [
                  FadeIn(
                    child: Image.file(
                      File(controller.compImagePath.value),
                      width: double.infinity,
                      height: double.infinity,
                      gaplessPlayback: true,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: Colors.red,
                        child: Center(
                            child: Text(
                          "webp",
                          style: TextStyle(fontSize: 13, color: white),
                        )),
                      ))
                ],
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[200],
                child:
                    // Center(
                    //   child: CircularProgressIndicator(
                    //     color: Colors.grey[400],
                    //   ),
                    // )
                    CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              );
      }),
    );
  }
}
