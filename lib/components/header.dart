import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/models/covid_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final covidData = Provider.of<CovidData>(context);
    var data = covidData.getResponseJson();
    String date = DateFormat.yMMMMd("en_US")
        .format(new DateTime.fromMillisecondsSinceEpoch(data["updated"]))
        .toString();
    return Container(
      padding: EdgeInsets.all(30),
      child: Row(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              data["country"] == null ? 'World' : data["country"],
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              date,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ],
        ),
        Spacer(),
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                covidData.getAllCountriesData();
              },
              child: Container(
                child: ClipOval(
                  child: _getCountryImage(data),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3, 3),
                      color: Colors.black26,
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      offset: Offset(-3, -3),
                      color: Colors.white,
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget _getCountryImage(data) {
    if (data["countryInfo"] == null) {
      return Image.asset(
        'assets/images/world.png',
        height: 50.0,
        width: 50.0,
        fit: BoxFit.cover,
      );
    }

    return CachedNetworkImage(
      imageUrl: data['countryInfo']['flag'],
      height: 50.0,
      width: 50.0,
      fit: BoxFit.cover,
    );
  }
}
