import 'package:h8_fli_geo_starter/model/geo.dart';

class GeoService {
  // TODO: 1. Complete the handlePermission() implementation.
  Future<bool> handlePermission() async {
    // TODO: 1.1. Check if the location service is available or not.
    /// The flow would be:
    /// - If the service is not available, then just return false.

    // TODO: 1.2. Check current permission.
    /// The flow would be:
    /// - If the current permission is denied, ask permission.
    /// - If the permission is still denied, throw an Exception.
    /// - If the permission is denied forever, throw an Exception.
    /// - Otherwise, return true.

    throw UnimplementedError();
  }

  // TODO: 2. Complete the getLocation() implementation.
  Future<Geo> getLocation() async {
    throw UnimplementedError();
  }
}
