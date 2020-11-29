import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/providers/search.dart';
import 'package:http/http.dart' as http;

class Searches with ChangeNotifier {
  List searchesList = [];

  Future<void> fetchSearch() async {
    const url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyB-PBPHzbYC90YVPMuEaM7cCMpEhayuZ4I&input=vodafone%20international&language=en&components=country%3Aeg&types=establishment';
    final response = await http.get(url);
    final extractedData = json.decode(response.body)['predictions'];
    for (var searchData in extractedData) {
      searchesList.add(Search(
          title: searchData['structured_formatting']['main_text'],
          subtitle: searchData['structured_formatting']['secondary_text']));
    }
    notifyListeners();
  }
}
