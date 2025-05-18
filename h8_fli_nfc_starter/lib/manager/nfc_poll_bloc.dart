import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nfc_poll_event.dart';
part 'nfc_poll_state.dart';

class NfcPollBloc extends Bloc<NfcPollEvent, NfcPollState> {
  // TODO: 1. Add NfcService as the dependency.
  NfcPollBloc() : super(NfcPollState()) {
    // TODO: 2. Add the events implementation.

    // TODO: 3. Listen to NFCTag data stream, then update state.

    // TODO: 4. Listen to NDEFRecords data stream, then update state.
  }
}
