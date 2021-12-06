import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<List<int>> compressFile(File file) async {
  var result;
  try {
    result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 200,
      minHeight: 300,
      quality: 80,
    );
    print(file.lengthSync());
    print(result!.length);
  } catch (e) {
    print('e => ${e.toString()}');
    // return null;
  }
  return result;
}
