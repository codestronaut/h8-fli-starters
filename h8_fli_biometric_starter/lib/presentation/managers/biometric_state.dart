part of 'biometric_bloc.dart';

@immutable
sealed class BiometricState {}

class BiometricInitial extends BiometricState {}

class BiometricAuthInProgress extends BiometricState {}

class BiometricAuthSuccess extends BiometricState {}

class BiometricAuthFail extends BiometricState {
  BiometricAuthFail({this.message});
  final String? message;
}
