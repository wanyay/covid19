import 'package:covid19/components/country.dart';
import 'package:covid19/components/detail_box.dart';
import 'package:covid19/components/header.dart';
import 'package:covid19/models/covid_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: _buildHomePage(context),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    final jsonData = Provider.of<CovidData>(context).getResponseJson();

    if (jsonData == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Country not found or doesn't have any cases",
            textAlign: TextAlign.center,
          ),
          Center(child: CountryButton(),)
        ],
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            Center(child: CountryButton()),
            DetailBox()
          ],
        ),
      ),
    );
  }
}
