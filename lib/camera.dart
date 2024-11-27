// my_camera_delegate.dart
import 'package:image_picker/image_picker.dart'; // For image picker
import 'dart:io'; // To work with file paths
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class MyCameraDelegate extends ImagePickerCameraDelegate {
  // This method is called to take a photo using the camera
  @override
  Future<XFile?> takePhoto(
      {ImagePickerCameraDelegateOptions options =
          const ImagePickerCameraDelegateOptions()}) async {
    // Call the _takeAPhoto method to handle the camera logic
    return _takeAPhoto(options.preferredCameraDevice);
  }

  // This method will actually open the camera and take a photo
  Future<XFile?> _takeAPhoto(CameraDevice? preferredCameraDevice) async {
    final ImagePicker _picker =
        ImagePicker(); // Create an instance of ImagePicker

    // Open the camera to take a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    // Return the photo if one is taken, otherwise null if the user cancels
    return photo;
  }

  @override
  Future<XFile?> takeVideo(
      {ImagePickerCameraDelegateOptions options =
          const ImagePickerCameraDelegateOptions()}) {
    // TODO: implement takeVideo
    throw UnimplementedError();
  }
}

// This function sets up the camera delegate for ImagePicker
void setUpCameraDelegate() {
  final ImagePickerPlatform instance = ImagePickerPlatform.instance;
  if (instance is CameraDelegatingImagePickerPlatform) {
    instance.cameraDelegate = MyCameraDelegate();
  }
}
