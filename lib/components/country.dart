import 'package:covid19/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CountryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              color: Colors.black12,
              blurRadius: 3,
            ),
            BoxShadow(
              offset: Offset(-3, -3),
              color: Colors.white,
              blurRadius: 3,
            ),
          ]),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text('Change Country'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => CountryScreen()),
          );
        },
      ),
    );
  }
}
