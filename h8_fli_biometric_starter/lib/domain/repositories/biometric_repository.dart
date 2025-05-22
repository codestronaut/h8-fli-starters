abstract class BiometricRepository {
  Future<bool> checkAvailability();
  Future<bool> authenticate({String? password});
}
