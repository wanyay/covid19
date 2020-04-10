import 'package:covid19/components/country.dart';
import 'package:covid19/components/detail_box.dart';
import 'package:covid19/components/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid 19 Tracker"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(),
              DetailBox(),
              Center(child: CountryButton())
            ],
          ),
        )
      ),
    );
  }
}
