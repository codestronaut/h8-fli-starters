import 'package:flutter/material.dart';
import 'package:h8_fli_geo_starter/view/geo_view.dart';

/// MARK: Setup Platform (Android).
// TODO: 1. Update compileSDK inside android/app/build.gradle.kts to 35.
// TODO: 2. Add the following permission inside AndroidManifest.xml file.
/*
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
*/

/// MARK: Setup Platform (iOS).
// TODO: 1. Add the following permission inside Info.plist file.
/*
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location when open.</string>
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TODO: 1. Init the dependencies: GeoService & GeoBloc.

  @override
  Widget build(BuildContext context) {
    // TODO: 2. Provide the bloc by wrap the MaterialApp with BlocProvider.
    return MaterialApp(
      title: 'Geo Hands-On',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: GeoView(),
    );
  }
}
