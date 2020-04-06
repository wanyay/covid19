import 'package:covid19/screens/covid.dart';
import 'package:covid19/theme/style.dart';
import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Covid(),
      theme: appTheme(),
    );
  }
}
