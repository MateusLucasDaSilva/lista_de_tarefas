import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart' as path;

class Utils {
  static Future<String> downloadFile(String url, String fileName) async {
    final dio = Dio();

    final directory = await path.getDownloadsDirectory();
    final filePath = '${directory!.path}/$fileName';
    await dio.download(
      url,
      filePath,
      onReceiveProgress: (count, total) {
        log('${(count / total * 100).toStringAsFixed(0)} % ################-> PERCENT <-#############');
      },
    );

    return filePath;
  }
}
