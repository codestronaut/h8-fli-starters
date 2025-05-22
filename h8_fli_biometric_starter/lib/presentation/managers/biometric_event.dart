part of 'biometric_bloc.dart';

@immutable
abstract class BiometricEvent {}

class BiometricCheckAvailability extends BiometricEvent {}

class BiometricAuthenticate extends BiometricEvent {
  BiometricAuthenticate({this.password});
  final String? password;
}
