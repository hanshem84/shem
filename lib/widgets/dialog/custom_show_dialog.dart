import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomShowDialog {
  generalError(String? message,
      {SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(
      'Error',
      (message != null) ? message : "Terjadi kesalahan",
      snackPosition: position,
      margin: position == SnackPosition.BOTTOM
          ? const EdgeInsets.all(16)
          : EdgeInsets.symmetric(horizontal: 10),
    );
  }

  showOneLineSnackBar(String? message,
      {SnackPosition position = SnackPosition.BOTTOM}) {
    Get.rawSnackbar(
      messageText: Text(
        (message != null) ? message : "Something Wrong.",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
      ),
      snackPosition: position,
      margin: position == SnackPosition.BOTTOM
          ? const EdgeInsets.all(16)
          : EdgeInsets.symmetric(horizontal: 10),
      borderRadius: 15,
      backgroundColor: Colors.grey.withOpacity(0.2),
      barBlur: 7.0,
      duration: const Duration(seconds: 3),
    );
  }

  showConnectionSnackBar(String? message) {
    Get.rawSnackbar(
      messageText: Text(
        (message != null) ? message : "Please check your internet connectivity",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 15,
      backgroundColor: Colors.red.withOpacity(0.2),
      barBlur: 7.0,
      duration: const Duration(seconds: 4),
    );
  }
}
