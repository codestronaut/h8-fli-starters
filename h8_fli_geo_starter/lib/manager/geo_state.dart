part of 'geo_bloc.dart';

@immutable
sealed class GeoState {}

final class GeoInitial extends GeoState {}

final class GeoLoading extends GeoState {}

final class GeoLoaded extends GeoState {
  GeoLoaded({required this.geo});
  final Geo geo;
}

final class GeoError extends GeoState {
  GeoError({this.message});
  final String? message;
}
