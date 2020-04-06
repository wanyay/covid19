import 'package:covid19/components/country.dart';
import 'package:covid19/components/detail_box.dart';
import 'package:covid19/components/header.dart';
import 'package:flutter/material.dart';

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid 19 Tracker"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            DetailBox(),
            Center(child: CountryButton())
          ],
        )
      ),
    );
  }
}
