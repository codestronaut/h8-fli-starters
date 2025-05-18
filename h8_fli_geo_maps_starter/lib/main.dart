import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h8_fli_geo_maps_starter/manager/geo_bloc.dart';
import 'package:h8_fli_geo_maps_starter/service/geo_service.dart';
import 'package:h8_fli_geo_maps_starter/view/geo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GeoService _geoService;
  late final GeoBloc _geoBloc;

  @override
  void initState() {
    _geoService = GeoService();
    _geoBloc = GeoBloc(service: _geoService);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _geoBloc,
      child: MaterialApp(
        title: 'Geo Hands-On',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: GeoView(),
      ),
    );
  }
}
