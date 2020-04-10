import 'dart:convert';
import 'package:covid19/models/country.dart';
import 'package:covid19/models/covid_data.dart';
import 'package:covid19/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: _loadCountryList(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final List<Country> data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final country = data[index];
                  return ListTile(
                    title: Text(
                      '${country.name}',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                    },
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Future<List<Country>> _loadCountryList(BuildContext context) async {
    List counties = jsonDecode(await DefaultAssetBundle.of(context)
        .loadString("assets/data/country.json"));
    List<Country> countryList = [];
    counties.forEach((country) => countryList.add(Country.fromJson(country)));
    return countryList;
  }
}
