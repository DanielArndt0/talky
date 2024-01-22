abstract class CloudDBServiceType<UserCredentialType> {
  Future<void> updateUser();
  Future<void> refreshUser();
}
