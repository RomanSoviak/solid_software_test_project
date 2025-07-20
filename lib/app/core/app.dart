import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/color_change_cubit.dart';
import 'package:solid_software_test_project/app/presentation/feature/color_change_page.dart';

/// The main application widget that sets up the app's root structure.
///
/// This widget configures the [MaterialApp] and provides the [ColorChangeCubit]
/// to the widget tree for state management.
class App extends StatelessWidget {
  /// Creates an instance of the [App] widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ColorChangeCubit(),
        child: const ColorChangePage(),
      ),
    );
  }
}
