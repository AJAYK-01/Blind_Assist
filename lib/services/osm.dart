import 'dart:convert';

import 'package:dio/dio.dart';

/// More examples see https://github.com/flutterchina/dio/tree/master/example
Future<List> searchOsm(keyword) async {
  var dio = Dio();
  keyword = Uri.encodeComponent(keyword);
  print("OSM Keyword: $keyword");
  final response = await dio.get(
      'https://nominatim.openstreetmap.org/search?q=$keyword&format=json&polygon=1&addressdetails=1');

  if (response != null) {
    try {
      var latitude = double.parse((response.data)[0]["lat"]);
      var longitude = double.parse((response.data)[0]["lon"]);
      if (latitude != null && longitude != null) {
        return [latitude, longitude];
      }
    } catch (e) {
      print(e);
    }
  }
}
