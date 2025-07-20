import 'package:flutter/material.dart';

class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({super.key});

  @override
  State<ChangeColorPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChangeColorPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          print("ffff");
        },
        child: Stack(
          children: [
            Container(color: Colors.red),
            Center(child: Text("Hey there")),
          ],
        ),
      ),
    );
  }
}
