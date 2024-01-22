import 'package:talky_chat/models/LocalContact.dart';

abstract class ContactsService {
  List<LocalContact> findAll();
  LocalContact? getByIndex(int index);
  List<LocalContact> where(bool Function(LocalContact contact) condition);
  int get length;
}
