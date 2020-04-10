import 'package:covid19/models/covid_data.dart';
import 'package:covid19/screens/loading_screen.dart';
import 'package:covid19/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CovidData(),
      child: MaterialApp(
        home: LoadingScreen(),
        theme: appTheme(),
      ),
    );
  }
}
