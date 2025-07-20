import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/cubit.dart';
import 'package:solid_software_test_project/app/presentation/feature/change_color_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ColorChangeCubit(),
        child: const ColorChangePage(),
      ),
    );
  }
}
