import 'package:astro/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PickImageUtils {
  factory PickImageUtils() => _instance;

  const PickImageUtils._();

  static final PickImageUtils _instance = PickImageUtils._();

  Future<XFile?> pickImage() async {
    try {
      // اطلب إذن الصور قبل ما تفتح الجاليري
      final status = await Permission.photos.request();

      if (status.isDenied || status.isPermanentlyDenied) {
        await showAppAlertDialog();
        return null;
      }

      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (image == null) return null;
      return XFile(image.path);
    } catch (e) {
      print('Pick image exception: $e');
      return null;
    }
  }
}

Future<void> showAppAlertDialog() async {
  return showDialog(
    context: sl<GlobalKey<NavigatorState>>().currentState!.context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text(
        'Permissions Denied',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Allow access to gallery and photos from settings.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await openAppSettings();
          },
          child: const Text("Settings"),
        ),
      ],
    ),
  );
}
