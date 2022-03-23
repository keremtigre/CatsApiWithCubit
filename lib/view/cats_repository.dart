
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:random_cats_app/cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> getCats();
}

class SampleCatsRepository implements CatsRepository {
  String baseUrl =
        "https://api.thecatapi.com/v1/images/search?breed_ids=beng&include_breeds=true";
   
  @override
  Future<List<Cat>> getCats() async {
    final response = await http.get(Uri.parse(baseUrl));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body) as List;
        return jsonBody.map((e) => Cat.fromJson(e)).toList();
      default:
        throw NetworkError(response.statusCode.toString(), response.body);
    }
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}