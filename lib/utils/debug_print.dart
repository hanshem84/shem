import 'dart:developer';
import 'package:flutter/foundation.dart';

dPrint(var v) {
  if (kDebugMode) {
    log("################### " + v.toString());
  }
}
