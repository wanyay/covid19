import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:covid19/models/covid_data.dart';

class DetailBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        direction: Axis.horizontal,
        children: _buildDetailBox(context),
      ),
    );
  }

  List<Padding> _buildDetailBox(BuildContext context) {
    return List.generate(
      8,
      (index) => Padding(
        padding: EdgeInsets.all(10.0),
        child: _buildContainer(index, context),
      ),
    );
  }

  Container _buildContainer(int index, BuildContext context) {
    BorderRadius borderRadius;
    String title = "Hello";
    String number = "9";
    final covidData = Provider.of<CovidData>(context);
    var data = covidData.getResponseJson();

    switch (index) {
      case 0:
        borderRadius = BorderRadius.only(topLeft: Radius.circular(15.0));
        title = "Total Case";
        number = data["cases"].toString();
        break;
      case 1:
        borderRadius = BorderRadius.only(topRight: Radius.circular(15.0));
        title = "Today Case";
        number = data["todayCases"].toString();

        break;
      case 2:
        title = "Total Deaths";
        number = data["deaths"].toString();

        break;
      case 3:
        title = "Today Deaths";
        number = data["todayDeaths"].toString();
        break;
      case 4:
        title = "Total Recovered";
        number = data["recovered"].toString();
        break;
      case 5:
        title = "Active";
        number = data["active"].toString();
        break;
      case 6:
        borderRadius = BorderRadius.only(bottomLeft: Radius.circular(15.0));
        title = data["countryInfo"] == null ? "Affected Countries" : "Total Tests";
        number = data["countryInfo"] == null ? data["affectedCountries"].toString() : data['tests'].toString();
        break;

      case 7:
        borderRadius = BorderRadius.only(bottomRight: Radius.circular(15.0));
        title = "Critical";
        number = data["critical"].toString();
        break;
    }

    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
              maxLines: 2,
            ),
            Text(
              number,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(4, 4), color: Colors.black12, blurRadius: 3),
            BoxShadow(
              offset: Offset(-4, -4),
              color: Colors.white,
              blurRadius: 3,
            )
          ]),
    );
  }
}
