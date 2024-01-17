import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shem/utils/debug_print.dart';
import 'package:shem/utils/secureStorage/secure_storage_init.dart';

import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ImageCompressController extends GetxController {
  final String imageUrl;
  var isLoading = false.obs;

  var isCompImage = false.obs;

  var compImagePath = "".obs;

  ImageCompressController({required this.imageUrl});

  @override
  void onInit() {
    // TODO: implement onInit

    checkCompress();
    super.onInit();
  }

  checkCompress() async {
    var compImage = await storage.read(key: imageUrl);

    if (compImage == null) {
      isCompImage(false);

      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        Uint8List bytes = response.bodyBytes;
        // String base64Image = base64Encode(bytes);
        dPrint("start comp :: " + DateTime.now().toString());
        await testComporessList(bytes);
        isCompImage(true);
        // isCompImage(true);
        // final image = Uint8List.fromList(imageList);
      } else {
        throw Exception('Failed to load image');
      }
    } else {
      // Image compress
      compImagePath(compImage);
      isCompImage(true);
    }
  }

  Future<Uint8List> testComporessList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(list,
        minHeight: 1080,
        minWidth: 1080,
        quality: 50,
        // rotate: 135,
        format: CompressFormat.webp);
    print(list.length);
    print(result.length);

    dPrint("end comp :: " + DateTime.now().toString());

    try {
      // Get the application support directory
      final directory = await getApplicationSupportDirectory();

      // Create a file in the application support directory
      final tempName = Uuid().v4();
      final File file = File('${directory.path}/$tempName.webp');

      // Write the Uint8List data to the file
      await file.writeAsBytes(result);

      print('Image saved to: ${file.path}');

      storage.write(key: imageUrl, value: file.path);
      compImagePath(file.path);
    } catch (e) {
      print('Error saving image: $e');
    }

    return result;
  }

  Future<Uint8List> compressAndTryCatch(String path) async {
    Uint8List? result;
    try {
      result = await FlutterImageCompress.compressWithFile(
        path,
        format: CompressFormat.webp,
      );
    } on UnsupportedError catch (e) {
      print(e);
      result = await FlutterImageCompress.compressWithFile(
        path,
        format: CompressFormat.jpeg,
      );
    }
    return result!;
  }
}
