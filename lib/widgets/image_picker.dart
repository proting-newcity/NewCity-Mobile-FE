import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showImagePickerModal(
  BuildContext context,
  Function(ImageSource) onImageSelected,
) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              onTap: () {
                onImageSelected(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: () {
                onImageSelected(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
