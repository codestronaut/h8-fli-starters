import 'package:h8_fli_biometric_starter/domain/repositories/biometric_repository.dart';

class BiometricCheckAvailabilityUseCase {
  final BiometricRepository repository;
  BiometricCheckAvailabilityUseCase({required this.repository});

  Future<bool> execute() {
    return repository.checkAvailability();
  }
}

class BiometricAuthenticateUseCase {
  final BiometricRepository repository;
  BiometricAuthenticateUseCase({required this.repository});

  Future<bool> execute({String? password}) {
    return repository.authenticate(password: password);
  }
}
