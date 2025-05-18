import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h8_fli_geo_maps_starter/manager/geo_bloc.dart';
import 'package:h8_fli_geo_maps_starter/model/geo.dart';

class GeoView extends StatefulWidget {
  const GeoView({super.key});

  @override
  State<GeoView> createState() => _GeoViewState();
}

class _GeoViewState extends State<GeoView> {
  // TODO: 1. Declare the GoogleMapController.
  // TODO: 2. Declate the CameraPosition for the initial location.

  @override
  void initState() {
    // TODO: 3. Initialize the GoogleMapController.
    // TODO: 4. Initialize the CameraPosition for the initial location.
    /// Provide the following paremeters:
    /// - target: initial location.
    /// - zoom: initial zoom level.
    super.initState();
  }

  // TODO: 5. Complete the _updateCameraPosition() implementation.
  void _updateCameraPosition(Geo geo) {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeoBloc, GeoState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: switch (state) {
                GeoInitial() => SizedBox(),
                GeoLoading() => CircularProgressIndicator(),
                // TODO: 6. Update the widget to display GoogleMap widget.
                GeoLoaded() => Column(
                  spacing: 8.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Latitude: ${state.geo.latitude}'),
                    Text('Longitude: ${state.geo.longitude}'),
                  ],
                ),
                GeoError() => Text('${state.message}'),
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<GeoBloc>().add(GeoGetLocationEvent());
            },
            child: Icon(Icons.my_location),
          ),
        );
      },
    );
  }
}
