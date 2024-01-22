// ignore_for_file: file_names

import 'package:talky_chat/controllers/interfaces/ChatsScreenController.dart';
import 'package:talky_chat/controllers/interfaces/NavigatorController.dart';
import 'package:talky_chat/models/LocalContact.dart';
import 'package:talky_chat/models/LocalUser.dart';
import 'package:talky_chat/providers/CurrentUserProvider.dart';
import 'package:talky_chat/services/interfaces/ContactsService.dart';

class ChatsScreenControllerImpl extends ChatsScreenController {
  final NavigatorController navigatorController;
  final ContactsService contactsService;
  final CurrentUserProvider currentUser;
  late final List<LocalContact> _chats;
  late final List<LocalContact> _contacts;

  ChatsScreenControllerImpl({
    required this.navigatorController,
    required this.contactsService,
    required this.currentUser,
  });

  @override
  void initState() {
    _contacts = contactsService.findAll();
    _chats = contactsService.where((contact) {
      if (contact.messages != null) {
        if (contact.messages!.isNotEmpty) {
          return true;
        }
      }
      return false;
    }).toList();
  }

  @override
  void userAvatarOnPressed() => navigatorController.goToProfile();

  @override
  void searchOnPressed() {}

  @override
  void fabOnPressed() {}

  @override
  void chatOnPressed() {}

  @override
  void contactOnPressed() {}

  @override
  LocalUser get localUser => currentUser.localUser;

  @override
  List<LocalContact> get chats => _chats;

  @override
  List<LocalContact> get contacts => _contacts;
}
