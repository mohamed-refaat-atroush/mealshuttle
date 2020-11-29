import 'package:flutter/cupertino.dart';
import 'package:mobile_app/providers/meal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Meals with ChangeNotifier {
  List<Meal> lightMealList = [];
  List<Meal> bestValueList = [];
  List<Meal> plusList = [];

  Future<void> fetchMEalData() async {
    const url = 'http://demo4833373.mockable.io/menu';
    final response = await http.get(url);
    final lightExtractedData = json.decode(response.body)['light'];
    final bestValueExtractedData = json.decode(response.body)['best_value'];
    final plusExtractedData = json.decode(response.body)['plus'];

    for (var mealData in lightExtractedData) {
      lightMealList.add(Meal(
          urlImage: mealData['img'],
          regularPrice: mealData['regular_price'],
          plusPrice: mealData['plus_price'],
          name: mealData['name'],
          restaurant: mealData['restaurant']));
    }
    for (var mealData in bestValueExtractedData) {
      bestValueList.add(Meal(
          urlImage: mealData['img'],
          regularPrice: mealData['regular_price'],
          plusPrice: mealData['plus_price'],
          name: mealData['name'],
          restaurant: mealData['restaurant']));
    }
    for (var mealData in plusExtractedData) {
      plusList.add(Meal(
          urlImage: mealData['img'],
          regularPrice: mealData['regular_price'],
          plusPrice: mealData['plus_price'],
          name: mealData['name'],
          restaurant: mealData['restaurant']));
    }
    notifyListeners();
  }
}
