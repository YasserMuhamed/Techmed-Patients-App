// import 'dart:io';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerHelper {
//   static final ImagePicker _picker = ImagePicker();

//   /// Pick an image from the gallery
//   /// Returns a [File] object or null if no image was picked
//   static Future<File?> pickFromGallery() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       return File(pickedImage.path);
//     }
//     return null;
//   }

//   /// Capture an image using the camera
//   /// Returns a [File] object or null if no image was captured
//   static Future<File?> pickFromCamera() async {
//     final XFile? capturedImage =
//         await _picker.pickImage(source: ImageSource.camera);
//     if (capturedImage != null) {
//       return File(capturedImage.path);
//     }
//     return null;
//   }

//   /// Pick an image from the specified source
//   /// Returns a [File] object or null if no image was selected
//   static Future<File?> pickImage(ImageSource source) async {
//     final XFile? image = await _picker.pickImage(source: source);
//     if (image != null) {
//       return File(image.path);
//     }
//     return null;
//   }

//   /// Pick an image from the specified source and open the cropper
//   /// Returns a [File] object or null if no image was selected or cropping was cancelled
//   static Future<File?> pickAndCropImage(
//     ImageSource source, {
//     CropAspectRatio? aspectRatio,
//     CropStyle cropStyle = CropStyle.circle,
//     List<CropAspectRatioPreset> aspectRatioPresets = const [
//       CropAspectRatioPreset.original,
//     ],
//   }) async {
//     final XFile? image = await _picker.pickImage(source: source);
//     if (image != null) {
//       return await cropImage(
//         File(image.path),
//         aspectRatio: aspectRatio,
//         cropStyle: CropStyle.circle,
//         aspectRatioPresets: aspectRatioPresets,
//       );
//     }
//     return null;
//   }

//   /// Crop an existing image
//   /// Returns a [File] object or null if cropping was cancelled
//   static Future<File?> cropImage(
//     File imageFile, {
//     CropAspectRatio? aspectRatio,
//     CropStyle cropStyle = CropStyle.circle,
//     List<CropAspectRatioPreset> aspectRatioPresets = const [
//       CropAspectRatioPreset.original,
//     ],
//   }) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: imageFile.path,
//       aspectRatio: aspectRatio,
//       uiSettings: [
//         AndroidUiSettings(
//             initAspectRatio: CropAspectRatioPreset.original,
//             aspectRatioPresets: aspectRatioPresets,
//             lockAspectRatio: aspectRatio != null,
//             cropStyle: cropStyle),
//         IOSUiSettings(
//           title: 'Crop Image',
//           minimumAspectRatio: 1.0,
//           cropStyle: cropStyle,
//           aspectRatioPresets: aspectRatioPresets,
//         ),
//       ],
//     );

//     if (croppedFile != null) {
//       return File(croppedFile.path);
//     }
//     return null;
//   }
// }
