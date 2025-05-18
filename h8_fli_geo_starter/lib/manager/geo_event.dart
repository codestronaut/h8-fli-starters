part of 'geo_bloc.dart';

@immutable
sealed class GeoEvent {}

class GeoInitEvent extends GeoEvent {}

class GeoGetLocationEvent extends GeoEvent {}
