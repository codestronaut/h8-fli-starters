import 'package:h8_fli_biometric_starter/data/datasources/biometric_data_source.dart';
import 'package:h8_fli_biometric_starter/data/datasources/remote_data_source.dart';
import 'package:h8_fli_biometric_starter/domain/repositories/biometric_repository.dart';
import 'package:h8_fli_biometric_starter/shared/local_storage.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  final BiometricDataSource dataSource;
  final RemoteDataSource remoteDataSource;
  BiometricRepositoryImpl({
    required this.dataSource,
    required this.remoteDataSource,
  });

  @override
  Future<bool> authenticate({String? password}) async {
    final localStorage = LocalStorage();
    final userPassword = await localStorage.getUserPassword();

    try {
      /// First time authenticate
      if (password != null && password.isNotEmpty) {
        final isAuthenticated = await remoteDataSource.checkAuthStatus(
          userPassword: password,
        );

        if (!isAuthenticated) throw Exception('Incorrect password');
        if (userPassword == null) await localStorage.setUserPassword(password);
        return true;
      }
      /// Authenticate
      else if (userPassword != null && userPassword.isNotEmpty) {
        if (await dataSource.authenticate()) {
          return remoteDataSource.checkAuthStatus(userPassword: userPassword);
        }

        throw Exception('Biometric authentication failed');
      } else {
        throw Exception('Use password to continue');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> checkAvailability() {
    return dataSource.checkAvailability();
  }
}
