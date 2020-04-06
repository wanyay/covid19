import 'package:covid19/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CountryButton extends StatefulWidget {
  @override
  _CountryButtonState createState() => _CountryButtonState();
}

class _CountryButtonState extends State<CountryButton> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: selected ? Offset(-3, -3) : Offset(3, 3),
              color: Colors.black12,
              blurRadius: 3,
            ),
            BoxShadow(
              offset: selected ? Offset(3, 3) : Offset(-3, -3),
              color: Colors.white,
              blurRadius: 3,
            ),
          ]),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text('Change Country'),
        onPressed: () {
          setState(() {
            selected = true;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => CountryScreen()),
          );
        },
      ),
    );
  }
}
