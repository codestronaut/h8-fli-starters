import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:h8_fli_biometric_starter/data/datasources/biometric_data_source.dart';
import 'package:h8_fli_biometric_starter/data/datasources/remote_data_source.dart';
import 'package:h8_fli_biometric_starter/data/repositories/biometric_repository_impl.dart';
import 'package:h8_fli_biometric_starter/domain/repositories/biometric_repository.dart';
import 'package:h8_fli_biometric_starter/domain/usecases/biometric_usecase.dart';
import 'package:h8_fli_biometric_starter/firebase_options.dart';
import 'package:h8_fli_biometric_starter/presentation/managers/biometric_bloc.dart';
import 'package:h8_fli_biometric_starter/presentation/pages/auth_page.dart';
import 'package:h8_fli_biometric_starter/presentation/pages/home_page.dart';
import 'package:local_auth/local_auth.dart';

// MARK: Dependency injection.
final locator = GetIt.instance;

void initDependencies() {
  // MARK: External Dependency.
  locator.registerLazySingleton<LocalAuthentication>(
    () => LocalAuthentication(),
  );

  // MARK: Data Sources.
  locator.registerLazySingleton<BiometricDataSource>(
    () => BiometricDataSource(localAuth: locator()),
  );
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  // MARK: Repositories.
  locator.registerLazySingleton<BiometricRepository>(
    () => BiometricRepositoryImpl(
      dataSource: locator(),
      remoteDataSource: locator(),
    ),
  );

  // MARK: Use cases.
  locator.registerLazySingleton<BiometricCheckAvailabilityUseCase>(
    () => BiometricCheckAvailabilityUseCase(repository: locator()),
  );
  locator.registerLazySingleton<BiometricAuthenticateUseCase>(
    () => BiometricAuthenticateUseCase(repository: locator()),
  );

  // MARK: State managements.
  locator.registerFactory<BiometricBloc>(
    () => BiometricBloc(
      checkAvailabilityUseCase: locator(),
      authenticateUseCase: locator(),
    ),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // MARK: Dependency injection.
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BiometricBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        initialRoute: '/auth',
        routes: {
          '/auth': (context) => AuthPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
