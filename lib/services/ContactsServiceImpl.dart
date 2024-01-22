import 'package:talky_chat/models/LocalContact.dart';
import 'package:talky_chat/repository/interfaces/ContactsRepository.dart';
import 'package:talky_chat/services/interfaces/ContactsService.dart';

class ContactsServiceImpl extends ContactsService {
  ContactsServiceImpl({
    required this.repository,
  });

  final ContactsRepository repository;

  @override
  List<LocalContact> findAll() => repository.findAll();

  @override
  LocalContact? getByIndex(int index) => repository.findAll()[index];

  @override
  List<LocalContact> where(bool Function(LocalContact contact) condition) =>
      repository.where(condition);

  @override
  int get length => repository.findAll().length;
}
