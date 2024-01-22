import 'package:talky_chat/models/LocalContact.dart';
import 'package:talky_chat/models/LocalUser.dart';

abstract class ChatsScreenController {
  void initState();
  void searchOnPressed();
  void fabOnPressed();
  void chatOnPressed();
  void contactOnPressed();
  void userAvatarOnPressed();

  LocalUser get localUser;
  List<LocalContact> get chats;
  List<LocalContact> get contacts;
}
