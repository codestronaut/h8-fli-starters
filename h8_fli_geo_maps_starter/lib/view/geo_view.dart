import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h8_fli_geo_maps_starter/manager/geo_bloc.dart';

class GeoView extends StatelessWidget {
  const GeoView({super.key});

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
