import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
      6,
      (index) => Padding(
        padding: EdgeInsets.all(10.0),
        child: _buildContainer(index, context),
      ),
    );
  }

  Container _buildContainer (int index, BuildContext context) {
    BorderRadius borderRadius;

    switch (index) {
      case 0:
        borderRadius = BorderRadius.only(topLeft: Radius.circular(15.0));
        break;
      case 1:
        borderRadius = BorderRadius.only(topRight: Radius.circular(15.0));
        break;
      case 4:
        borderRadius = BorderRadius.only(bottomLeft: Radius.circular(15.0));
        break;
      case 5:
        borderRadius = BorderRadius.only(bottomRight: Radius.circular(15.0));
    }

    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 2.8,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Recovered',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
              maxLines: 1,
            ),
            Text('20000', style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            color: Colors.black12,
            blurRadius: 3
          ),
          BoxShadow(
            offset: Offset(-4, -4),
            color: Colors.white,
            blurRadius: 3,
          )
        ]
      ),
    );
  }
}
