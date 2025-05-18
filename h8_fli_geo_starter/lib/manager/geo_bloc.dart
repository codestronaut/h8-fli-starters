import 'package:bloc/bloc.dart';
import 'package:h8_fli_geo_starter/model/geo.dart';
import 'package:meta/meta.dart';

part 'geo_event.dart';
part 'geo_state.dart';

class GeoBloc extends Bloc<GeoEvent, GeoState> {
  // TODO: 1. Add GeoService as the dependency.
  GeoBloc() : super(GeoInitial()) {
    on<GeoInitEvent>((event, emit) async {
      // TODO: 2. Complete the GeoInitEvent implementation.
      /// The flow would be:
      /// 1. Emit the loading state.
      /// 2. Call the handlePermission() method from service.
      /// 3. Emit the loaded state when the permission is granted.
      /// 3. Otherwise, emit the error state and pass the Exception message.
    });

    on<GeoGetLocationEvent>((event, emit) async {
      // TODO: 2. Complete the GeoGetLocationEvent implementation.
      /// The flow would be:
      /// 1. Emit the loading state.
      /// 2. Call the getLocation() method from service.
      /// 3. Emit the loaded state when location returned successfully.
      /// 4. Otherwise, emit the error state and pass the Exception message.
    });

    add(GeoInitEvent());
  }
}
