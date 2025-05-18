part of 'geo_bloc.dart';

@immutable
sealed class GeoEvent {}

class GeoInitEvent extends GeoEvent {}

class GeoGetLocationEvent extends GeoEvent {}

// TODOL 1. Add GeoStartRealtimeEvent to start listening for realtime location.

// TODO: 2. Add GeoUpdateLocationEvent to update the location state.
