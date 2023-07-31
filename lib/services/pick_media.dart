import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';
import 'package:keepo/utils/alert_toast.dart';
import 'package:keepo/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:math';

class PickMedia {
  final double limit = 104857600; //100 MB

  Future<File?> pickImage({FileType? type}) async {
    final file = await FilePicker.platform.pickFiles(
      type: type ?? FileType.image,
      allowCompression: true,
    );

    if (file != null) {
      File file1 = File(file.files.single.path!);
      if (file1.lengthSync() > limit) {
        showWarningTopFlash(fileSizeLimit);
        return null;
      }
      return file1;
    } else {
      return null;
    }
  }

  Future<List<PlatformFile>?> pickImages({
    FileType? type,
    bool? allowMultiple,
    bool? allowCompression,
    List<String>? allowedExtensions,
    double? limitFile = 104857600,
  }) async {
    try {
      final file = await FilePicker.platform.pickFiles(
          type: type ?? FileType.media,
          allowCompression: true,
          allowMultiple: allowMultiple ?? false,
          allowedExtensions: allowedExtensions);

      if (file != null) {
        // var tempdir = await getTemporaryDirectory();
        // for (var element in file.files) {
        //   if(File(element.path!).existsSync()) {
        //     if(File(element.path!).lengthSync() > limit) {
        //       showWarningTopFlash(fileSizeLimit);
        //       return null;
        //     }
        //   } else {
        //     final newFile = await File(tempdir.path+element.name).create(recursive: true);
        //     if(newFile.lengthSync() > limit) {
        //       showWarningTopFlash(fileSizeLimit);
        //       return null;
        //     }
        //   }
        // }

        if (file.files
            .any((element) => File(element.path!).lengthSync() >= limitFile!)) {
          showWarningTopFlash(
              '$fileSizeLimit ${(limitFile! / 1024000).toStringAsFixed(0)} MB');
          return null;
        }
        return file.files;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("ERROR GETTING FILE ==> $e");
    }
    return null;
  }

  Future<List<File?>> compressFile(List<File?> listFile, {int? quality}) async {
    List<File> result = List.empty(growable: true);

    for (int i = 0; i < listFile.length; i++) {
      if (listFile[i] != null) {
        var tempdir = await getTemporaryDirectory();
        var targetPath = '${tempdir.path}$i.jpeg';
        debugPrint('targetPath :  $targetPath');
        // var regImage = RegExp(r"jpg|gif|png");
        Pattern pattern = r'^.*.(mp4|webm|ogg|mov)$';
        final regex = RegExp('$pattern');
        debugPrint("THE FILE BEFORE COMPRESS ====> ${listFile[i]!.path}");
        result.add(regex.hasMatch(listFile[i]!.path.toLowerCase())
            ? await compressVideo(listFile[i]!, targetPath)
            : await compressImage(listFile[i]!, quality: quality));
        // result.add(
        //   listFile[i]!.path.contains(regImage)
        //       ? await compressImage(listFile[i]!, targetPath)
        //       : await compressVideo(listFile[i]!, targetPath),
        // );
      }
    }
    debugPrint(result.toString());
    return result;
  }

  Future<File> compressImage(File file /*, String targetPath*/,
      {int? quality}) async {
    final result = await FlutterNativeImage.compressImage(
      file.absolute.path,
      quality: 60,
    );
    // debugPrint('compress image');
    // var result = await FlutterImageCompress.compressAndGetFile(
    //   file.absolute.path,
    //   targetPath,
    //   format: CompressFormat.jpeg,
    //   quality: 60,
    // );
    debugPrint(result.toString());
    // if (result != null) {
    debugPrint(file.lengthSync().toString());
    debugPrint(result.lengthSync().toString());

    return result;
    // } else {
    //   return file;
    // }
  }

  Future<File> compressVideo(File file, String targetPath) async {
    debugPrint('compress video');
    debugPrint(VideoCompress.isCompressing.toString());

    await VideoCompress.cancelCompression();
    var result = await VideoCompress.compressVideo(
      file.absolute.path,
      includeAudio: true,
      quality: VideoQuality.LowQuality,
    );
    // await VideoCompress.cancelCompression();

    // debugPrint(result.toString());
    if (result != null) {
      debugPrint(file.lengthSync().toString());
      debugPrint(result.filesize.toString());
      debugPrint(result.file.toString());
      return result.file ?? file;
    } else {
      return file;
    }
  }

  Future<String> resizePhoto(String filePath, int width, int height) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(filePath);

    // int? width = properties.width;
    var offset = ((height ?? 0) - (width ?? 0)) / 2;

    debugPrint("SIZE HEIGHT ${height} SIZE WIDTH ${width}");

    File croppedFile = await FlutterNativeImage.cropImage(
      filePath,
      0,
      offset.round(),
      width,
      1000,
    );

    return croppedFile.path;
  }
}

class ImageUtils {
  static Future<File> imageToFile(
      {required String imageName, required String ext}) async {
    var bytes = await rootBundle.load('assets/$imageName.$ext');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/profile.png');
    await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }

  static Future<File> urlToFile(String imageUrl) async {
    var rng = Random();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File('$tempPath${rng.nextInt(100)}.png');
    http.Response response = await http.get(Uri.parse(imageUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
