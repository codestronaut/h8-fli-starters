import 'package:flutter/material.dart';

/// MARK: Setup Platform (Android).
// TODO: 1. Update minSDK inside android/app/build.gradle.kts to 23.
// TODO: 2. Add the following permission inside AndroidManifest.xml file.
/*
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
*/
// TODO: 3. Change the MainActivity type to FlutterFragmentActivity.

/// MARK: Setup Platform (iOS).
// TODO: 1. Add the following permission inside Info.plist file.
/*
<key>NSFaceIDUsageDescription</key>
<string>Application need to use Face ID to secure your data</string>
*/

// MARK: Dependency injection.
// TODO: 1. Add dependency injection for managing the dependencies easily.

void main() {
  // MARK: Dependency injection.
  // TODO: 2. Initialize the dependency injection here.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Define the routing system.
    /*
      There are two pages in this app. Create the routes configuration
      for that pages, then set page that handle the auth process
      as the initial route.
    */
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
    );
  }
}
