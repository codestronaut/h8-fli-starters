import 'package:flutter/material.dart';

class GeoView extends StatelessWidget {
  const GeoView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: 1. Wrap this widget tree with the BlocBuilder.
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO: 2. Embed state with Geo.latitude to the text.
            Text('Latitude: 0'),
            // TODO: 3. Embed state with Geo.longitude to the text.
            Text('Longitude: 0'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 4. Call event to get the current location.
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}
