import 'package:covid19/models/covid_data.dart';
import 'package:covid19/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();

  String countryCode = "";

  LoadingScreen({this.countryCode}) {
    if (countryCode == "") {
      CovidData().getAllCountriesData();
    } else {
      CovidData().getDataByCountryCode(countryCode);
    }
  }

}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Widget build(BuildContext context) {

    final covidData = Provider.of<CovidData>(context);
    return Scaffold(
      body: covidData.isFetching ? SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'COVID 19 TRACKER',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SpinKitFoldingCube(
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ): HomeScreen(),
    );
  }
}
