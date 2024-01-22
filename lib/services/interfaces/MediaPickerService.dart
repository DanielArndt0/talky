// ignore: file_names
import 'package:image_picker/image_picker.dart';

abstract class MediaPickerService {
  Future getImageFromGallery(void Function(XFile file) callback);
  Future getImageFromCamera(void Function(XFile file) callback);
}
