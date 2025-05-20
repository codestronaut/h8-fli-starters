import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'biometric_event.dart';
part 'biometric_state.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  // TODO: 1. Add usecases as the dependencies.
  BiometricBloc() : super(BiometricInitial()) {
    // TODO: 2. Complete the events implementation.
    on<BiometricEvent>((event, emit) {});
  }
}
