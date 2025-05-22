import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricDataSource {
  final LocalAuthentication localAuth;
  BiometricDataSource({required this.localAuth});

  Future<bool> checkAvailability() async {
    try {
      final isAvailable = await localAuth.canCheckBiometrics;
      final isSupported = await localAuth.isDeviceSupported();
      return isAvailable && isSupported;
    } catch (e) {
      log('Biometrics error: $e', name: 'checkAvailability');
      return false;
    }
  }

  Future<bool> authenticate() async {
    try {
      return localAuth.authenticate(
        localizedReason: 'Authenticate to enter home page',
        options: AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: false,
          sensitiveTransaction: false,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      log('Biometrics error: $e', name: 'authenticate');
      return false;
    }
  }
}
