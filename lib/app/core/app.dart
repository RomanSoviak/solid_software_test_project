import 'package:flutter/material.dart';

import '../presentation/feature/change_color_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ChangeColorPage());
  }
}
