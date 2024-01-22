import 'package:talky_chat/models/LocalContact.dart';
import 'package:talky_chat/models/MessageModel.dart';
import 'package:talky_chat/repository/interfaces/Repository.dart';
import 'package:uuid/uuid.dart';

abstract class ContactsRepository extends Repository<LocalContact> {
  final List<LocalContact> _localContacts = [
    LocalContact(
      name: 'Rodrigo Arndt',
      status: 'Today is a better day',
      messages: [
        MessageModel(
          uuid: const Uuid().v1(),
          author: 'Rodrigo Arndt',
          message: 'Olá, Mundo',
          timestamp: '17:06',
        ),
      ],
    ),
    LocalContact(
      name: 'Davi Arndt',
      status: 'Today is a better day',
      messages: [
        MessageModel(
          uuid: const Uuid().v1(),
          author: 'Davi Arndt',
          message: 'Olá, Mundo',
          timestamp: '17:06',
        ),
      ],
    ),
    LocalContact(
      name: 'Caren Arndt',
      status: 'Today is a better day',
      messages: [
        MessageModel(
          uuid: const Uuid().v1(),
          author: 'Caren Arndt',
          message: 'Olá, Mundo',
          timestamp: '17:06',
        ),
      ],
    ),
    LocalContact(
      name: 'João Vitor',
      status: 'Today is a better day',
      messages: [
        MessageModel(
          uuid: const Uuid().v1(),
          author: 'João Vitor',
          message: 'Olá, Mundo',
          timestamp: '17:06',
        ),
      ],
    ),
  ];

  @override
  List<LocalContact> findAll() => _localContacts;

  @override
  void insert(LocalContact element) {}

  @override
  void remove(LocalContact element) {
    _localContacts.remove(element);
  }

  @override
  List<LocalContact> where(bool Function(LocalContact element) condition) =>
      _localContacts.where(condition).toList();

  @override
  void removeWhere(bool Function(LocalContact element) condition) =>
      _localContacts.removeWhere(condition);
}
