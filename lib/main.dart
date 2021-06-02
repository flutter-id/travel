import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() => runApp(WidgetApp());

class WidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
