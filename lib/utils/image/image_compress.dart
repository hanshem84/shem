import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

Future<XFile> compressToJpeg(
  File file,
) async {
  final dir = await getTemporaryDirectory();
  final tempName = Uuid().v4();
  final targetPath = dir.absolute.path + "/$tempName.jpg";
  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    format: CompressFormat.jpeg,
    autoCorrectionAngle: true,
    keepExif: true,
    quality: 100,
  ).catchError((onError) {});

  var decodedImage = await decodeImageFromList(await result!.readAsBytes()).catchError((onError) {});

  String name = Uuid().v4() + "img";
  int minHeight = 1350;
  int minWidth = 1080;
  String orientation;
  if (decodedImage.width == decodedImage.height) {
    minHeight = 1080;
    minWidth = 1080;
    orientation = "se";
  } else {
    if (decodedImage.width > decodedImage.height) {
      minHeight = 680;
      minWidth = 1080;
      orientation = "lse";
    } else {
      minHeight = 1350;
      minWidth = 1080;
      orientation = "ptt";
    }
  }

  final myPath = dir.absolute.path + "/$name-cmp-$orientation.jpg";
  var finalResult = await FlutterImageCompress.compressAndGetFile(
    result.path,
    myPath,
    format: CompressFormat.jpeg,
    autoCorrectionAngle: true,
    keepExif: true,
    minWidth: minWidth,
    minHeight: minHeight,
    quality: 50,
  ).catchError((onError) {});

  return finalResult!;
}
