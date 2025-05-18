import 'package:bloc/bloc.dart';
import 'package:h8_fli_geo_maps_starter/model/geo.dart';
import 'package:h8_fli_geo_maps_starter/service/geo_service.dart';

import 'package:meta/meta.dart';

part 'geo_event.dart';
part 'geo_state.dart';

class GeoBloc extends Bloc<GeoEvent, GeoState> {
  final GeoService service;
  // TODO: 1. Initialize StreamSubscription<Geo> to manage the stream.
  GeoBloc({required this.service}) : super(GeoInitial()) {
    on<GeoInitEvent>((event, emit) async {
      try {
        emit(GeoLoading());
        final isGranted = await service.handlePermission();
        if (isGranted) {
          add(GeoGetLocationEvent());
          // TODO: 4. Call GeoStartRealtimeEvent to start listening.
        }
      } catch (e) {
        emit(GeoError(message: e.toString()));
      }
    });

    on<GeoGetLocationEvent>((event, emit) async {
      try {
        emit(GeoLoading());
        final geo = await service.getLocation();
        emit(GeoLoaded(geo: geo));
      } catch (e) {
        emit(GeoError(message: e.toString()));
      }
    });

    // TODO: 2. Add the GeoStartRealtimeEvent implementation.

    // TODO: 3. Add the GeoUpdateLocationEvent implementation.

    add(GeoInitEvent());
  }

  @override
  Future<void> close() {
    // TODO: 5. Cancel the StreamSubscription<Geo> to prevent memory leaks.
    return super.close();
  }
}
