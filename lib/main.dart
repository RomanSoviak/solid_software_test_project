import 'package:flutter/material.dart';
import 'package:solid_software_test_project/app/core/app.dart';
import 'package:solid_software_test_project/app/data/feature/color/color_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorManager.instance.initialize();
  runApp(const App());
}
