import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h8_fli_biometric_starter/presentation/managers/biometric_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  /// PERFORMANCE ISSUE DEMO:
  /// The following list is created inside the build method, causing it to be recreated on every rebuild.
  /// This is inefficient and can be detected in Flutter DevTools as unnecessary rebuilds.
  ///
  /// SOLUTION: Move such objects to the State class and initialize them once in initState.
  ///
  /// MEMORY LEAK DEMO:
  /// The following TextEditingController is created but never disposed, causing a memory leak.
  /// This can be detected in Flutter DevTools memory tab.
  ///
  /// SOLUTION: Dispose of controllers in the dispose() method.
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    context.read<BiometricBloc>().add(BiometricCheckAvailability());
    super.initState();
  }

  // Uncomment the following to fix the memory leak:
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  /// WIDGET-IN-FUNCTION DEMO:
  /// Defining widgets as functions inside the State class is not recommended.
  /// The function is re-created on every build, and the returned widget may be rebuilt unnecessarily.
  ///
  /// SOLUTION: Define reusable widgets as separate Widget classes or as const widgets if possible.
  Widget _demoFunctionWidget() {
    return Icon(Icons.warning, color: Colors.orange, size: 32);
  }

  @override
  Widget build(BuildContext context) {
    // PERFORMANCE ISSUE: This list is recreated on every build.
    // final List<String> demoList = List.generate(1000, (index) => 'Item #$index');
    // SOLUTION: Move demoList to State and initialize once.

    return Scaffold(
      body: Center(
        child: BlocConsumer<BiometricBloc, BiometricState>(
          listener: (context, state) {
            if (state is BiometricAuthSuccess) {
              Navigator.of(context).pushNamed('/home');
            }

            if (state is BiometricAuthFail) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message ?? '')));
            }
          },
          builder: (context, state) {
            // PERFORMANCE ISSUE: This list is recreated on every build.
            final List<String> demoList = List.generate(
              1000,
              (index) => 'Item #$index',
            );
            // Use demoList in a way that triggers rebuilds, e.g., in a ListView (not shown for brevity)

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// CONST WIDGET DEMO:
                /// The following widget could be marked as `const`.
                /// Const widgets are not rebuilt unnecessarily, which you can demonstrate in Flutter DevTools.
                ///
                /// SOLUTION: Add the `const` keyword to widgets that never change.
                /// For demo, this is intentionally left non-const.
                FlutterLogo(size: 48),

                /// WIDGET-IN-FUNCTION DEMO:
                /// The following widget is built by a function in the State class, which is not recommended.
                /// For demo, this is intentionally left as is.
                _demoFunctionWidget(),
                Text(switch (state) {
                  BiometricInitial() => 'Unknown state',
                  BiometricAuthInProgress() => 'Authentication in progress..',
                  BiometricAuthSuccess() => 'Authentication successful',
                  BiometricAuthFail() => 'Authentication failed.',
                }),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller:
                        _controller, // MEMORY LEAK: controller not disposed
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<BiometricBloc>().add(
                            BiometricAuthenticate(),
                          );
                        },
                        icon: Icon(Icons.fingerprint),
                      ),
                    ),
                    onSubmitted: (value) {
                      context.read<BiometricBloc>().add(
                        BiometricAuthenticate(password: value),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
