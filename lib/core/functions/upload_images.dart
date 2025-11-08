import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/constant/dataBase_keys.dart';

Future<String?> uploadFileToCloudinary(File file, String uploadPreset) async {
  try {
    final cloudName = DatabaseKeys.cloudName;
    final dio = Dio();
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      'upload_preset': uploadPreset,
    });
    final response = await dio.post(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
      data: formData,
    );
    if (response.statusCode == 200) {
      return response.data['secure_url']; // Return the image URL
    } else {
      showCustomSnackBar(response.statusCode.toString());
      return null;
    }
  } on DioException catch (e) {
    log(e.message.toString());
    showCustomSnackBar('Upload failed: ${e.message}');
    return null;
  }
}
