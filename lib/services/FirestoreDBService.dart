import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talky_chat/models/LocalUser.dart';
import 'package:talky_chat/providers/CurrentUserProvider.dart';
import 'package:talky_chat/services/interfaces/CloudDBService.dart';

class FirestoreDBService extends CloudDBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CurrentUserProvider currentUser;

  FirestoreDBService({required this.currentUser});

  @override
  Future<void> updateUser() => _firestore
      .collection('users')
      .doc(currentUser.userCredential!.user!.uid)
      .set(currentUser.localUser.toJson());

  @override
  Future<void> refreshUser() async {
    final doc = await _firestore
        .collection('users')
        .doc(currentUser.userCredential!.user!.uid)
        .get();
    if (doc.exists) {
      currentUser.updateLocalUser(LocalUser.fromJson(doc.data()!));
    }
  }

  // void addContact(CurrentUserProvider user) => _firestore
  //     .collection('contacts')
  //     .doc(user.userCredential!.user!.uid)
  //     .set();
}
