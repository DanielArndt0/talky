// ignore_for_file: file_names

import 'package:image_picker/image_picker.dart';
import 'package:talky_chat/services/interfaces/MediaPickerService.dart';

class MediaPickerServiceImpl extends MediaPickerService {
  MediaPickerServiceImpl._();
  static final MediaPickerService instance = MediaPickerServiceImpl._();

  @override
  getImageFromGallery(void Function(XFile file) callback) =>
      _getImageFrom(callback, ImageSource.gallery);

  @override
  getImageFromCamera(void Function(XFile file) callback) =>
      _getImageFrom(callback, ImageSource.camera);

  Future _getImageFrom(
    void Function(XFile file) callback,
    ImageSource src,
  ) async {
    final file = await ImagePicker().pickImage(source: src);
    if (file != null) {
      callback(file);
    }
  }
}
