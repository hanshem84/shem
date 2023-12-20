import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shem/utils/debug_print.dart';
import 'package:shem/utils/image/image_compress.dart';
import 'package:shem/utils/json_stirng_to_map.dart';

apiGet(var url, var header) async {
  Response? response;
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true, responseHeader: true, responseBody: true, error: true, logPrint: dPrint));

  // dPrint("## API URL :: $url");

  if (header != null) {
    var headerMap = jsonStringToMap(header);

    for (var i = 0; i < headerMap.length; i++) {
      dio.options.headers[headerMap.keys.elementAt(i)] = headerMap.values.elementAt(i);
    }
    // dPrint("## HEADER :: ${dio.options.headers}");
  }

  try {
    response = await dio.get(url);
    // dPrint("## StatusCode :: ${response.statusCode}");
    // dPrint("## Response :: ${jsonEncode(response.data)}");
    return response;
  } catch (exception) {
    if (exception.runtimeType == DioError) {
      var dioException = exception as DioError;
      // dPrint("## Dio Error Response :: ${jsonEncode(dioException.response)}");
      return dioException.response!;
    }
  }
}

apiGetParam(var url, var header, var param) async {
  Response? response;
  var dio = Dio();
  // dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true, responseHeader: true, responseBody: true, error: true, logPrint: dPrint));

  // dPrint("## API URL :: $url");

  if (header != null) {
    var headerMap = jsonStringToMap(header);

    for (var i = 0; i < headerMap.length; i++) {
      dio.options.headers[headerMap.keys.elementAt(i)] = headerMap.values.elementAt(i);
    }
    // dPrint("## HEADER :: ${dio.options.headers}");
  }

  try {
    response = await dio.get(url, queryParameters: param);
    // dPrint("## StatusCode :: ${response.statusCode}");
    // dPrint("## Response :: ${jsonEncode(response.data)}");
    return response;
  } catch (exception) {
    if (exception.runtimeType == DioError) {
      var dioException = exception as DioError;
      // dPrint("## Dio Error Response :: ${jsonEncode(dioException.response)}");
      return dioException.response!;
    }
  }
}

apiPost(var url, var data, var header) async {
  Response? response;
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true, responseHeader: true, responseBody: true, error: true, logPrint: dPrint));

  // dPrint("## API URL :: $url");

  if (header != null) {
    var headerMap = jsonStringToMap(header);

    for (var i = 0; i < headerMap.length; i++) {
      dio.options.headers[headerMap.keys.elementAt(i)] = headerMap.values.elementAt(i);
    }
    // dPrint("## HEADER :: ${dio.options.headers}");
  }

  try {
    response = await dio.post(url, data: data);
    // dPrint("## StatusCode :: ${response.statusCode}");
    // dPrint("## Response :: ${jsonEncode(response.data)}");
    return response;
  } catch (exception) {
    if (exception.runtimeType == DioError) {
      var dioException = exception as DioError;
      // dPrint("## Dio Error Response :: ${jsonEncode(dioException.response)}");
      return dioException.response!;
    }
  }
}

apiPut(var url, var data, var header) async {
  Response? response;
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true, responseHeader: true, responseBody: true, error: true, logPrint: dPrint));

  // dPrint("## API URL :: $url");

  if (header != null) {
    var headerMap = jsonStringToMap(header);

    for (var i = 0; i < headerMap.length; i++) {
      dio.options.headers[headerMap.keys.elementAt(i)] = headerMap.values.elementAt(i);
    }
    // dPrint("## HEADER :: ${dio.options.headers}");
  }

  try {
    response = await dio.put(url, data: data);
    // dPrint("## StatusCode :: ${response.statusCode}");
    // dPrint("## Response :: ${jsonEncode(response.data)}");
    return response;
  } catch (exception) {
    if (exception.runtimeType == DioError) {
      var dioException = exception as DioError;
      // dPrint("## Dio Error Response :: ${jsonEncode(dioException.response)}");
      return dioException.response!;
    }
  }
}

apiFetch(var url, var header) async {
  Response? response;
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true, responseHeader: true, responseBody: true, error: true, logPrint: dPrint));

  // dPrint("## API URL :: $url");

  if (header != null) {
    var headerMap = jsonStringToMap(header);

    for (var i = 0; i < headerMap.length; i++) {
      dio.options.headers[headerMap.keys.elementAt(i)] = headerMap.values.elementAt(i);
    }
    // dPrint("## HEADER :: ${dio.options.headers}");
  }

  try {
    response = await dio.fetch(url);
    dPrint("## StatusCode :: ${response.statusCode}");
    dPrint("## Response :: ${jsonEncode(response.data)}");
    return response;
  } catch (exception) {
    if (exception.runtimeType == DioError) {
      var dioException = exception as DioError;
      dPrint("## Dio Error Response :: ${jsonEncode(dioException.response)}");
      return dioException.response!;
    }
  }
}

apiDelete(var url, var data, var header) async {
  Response? response;
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true, responseHeader: true, responseBody: true, error: true, logPrint: dPrint));

  // dPrint("## API URL :: $url");

  if (header != null) {
    var headerMap = jsonStringToMap(header);

    for (var i = 0; i < headerMap.length; i++) {
      dio.options.headers[headerMap.keys.elementAt(i)] = headerMap.values.elementAt(i);
    }
    // dPrint("## HEADER :: ${dio.options.headers}");
  }

  try {
    response = await dio.delete(url, data: data);
    // dPrint("## StatusCode :: ${response.statusCode}");
    // dPrint("## Response :: ${jsonEncode(response.data)}");
    return response;
  } catch (exception) {
    if (exception.runtimeType == DioError) {
      var dioException = exception as DioError;
      // dPrint("## Dio Error Response :: ${jsonEncode(dioException.response)}");
      return dioException.response!;
    }
  }
}

apiPatch(var url, var data, var header) async {
  Response? response;
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true, requestBody: true, responseHeader: true, responseBody: true, error: true, logPrint: dPrint));

  // dPrint("## API URL :: $url");

  if (header != null) {
    var headerMap = jsonStringToMap(header);

    for (var i = 0; i < headerMap.length; i++) {
      dio.options.headers[headerMap.keys.elementAt(i)] = headerMap.values.elementAt(i);
    }
    // dPrint("## HEADER :: ${dio.options.headers}");
  }

  try {
    response = await dio.patch(url, data: data);
    // dPrint("## StatusCode :: ${response.statusCode}");
    // dPrint("## Response :: ${jsonEncode(response.data)}");
    return response;
  } catch (exception) {
    if (exception.runtimeType == DioError) {
      var dioException = exception as DioError;
      // dPrint("## Dio Error Response :: ${jsonEncode(dioException.response)}");
      return dioException.response!;
    }
  }
}

imageUpload(String apiUrl, String imagePath) async {
  File decompressImage = await compressToJpeg(File(imagePath));
  String fileExtension = decompressImage.path.split(".").last;
  List<int> imageBytes = decompressImage.readAsBytesSync();

  String base64File = base64Encode(imageBytes);

  var header = {
    "Content-Type": "application/json",
  };

  var body = {
    "data": [base64File],
    "extension": [fileExtension],
    "thumbnail": false,
  };

  var result = await apiPost(apiUrl + "s3/upload", body, header);
  // var result = await apiPost("http://54.180.40.23:8080/api/v1/s3/upload", body, header);
  // var result = await apiPost(apiUrl + "s3/upload", body, header);
  return result.data;
}
