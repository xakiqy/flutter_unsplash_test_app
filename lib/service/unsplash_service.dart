import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_unsplash_test_app/model/unsplash_model.dart';

Future<List<Result>> fetchPhotos(int offset) async {

  final uri = Uri.https('api.unsplash.com', 'search/photos', {
    'client_id' : 'cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0',
    'query':'weather',
    'page' : offset.toString()
  });

  final response = await http.get(uri);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UnsplashModel.fromJson(jsonDecode(response.body)).results;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load photos');
  }
}