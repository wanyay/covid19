import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class CovidData extends ChangeNotifier {
  String _resultJson = "";

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  CovidData() {
    getAllCountriesData();
  }

  Future<void> getDataByCountryCode(String countryCode) async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get("https://corona.lmao.ninja/countries/$countryCode");

    if (response.statusCode == 200) {
      _resultJson = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }


  Future<void> getAllCountriesData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get("https://corona.lmao.ninja/all");

    if (response.statusCode == 200) {
      _resultJson = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  dynamic getResponseJson() {
    if (_resultJson.isNotEmpty) {
      var json = jsonDecode(_resultJson);
    
      return json;
    }
    return null;
  }
}
