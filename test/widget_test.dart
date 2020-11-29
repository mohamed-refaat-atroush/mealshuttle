import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app/main.dart';

void main() {
  generateLocationPreviewImage();
}

Future<void> generateLocationPreviewImage() async {
  final url =
      'https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyB-PBPHzbYC90YVPMuEaM7cCMpEhayuZ4I&place_id=ChIJk--hajGWNz4RAfRG58NCacI&language=en';
  final respose = await http.get(url);
  print(json.decode(respose.body));
}
