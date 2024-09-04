import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/courses.model.dart';

class ProductRepository {
  Future<CourseModel> findByName(String name) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/products?name=$name'));
    if (response.statusCode != 200) {
      throw Exception();
    }
    final respondeData = jsonDecode(response.body);
    if (respondeData.isEmpty) {
      throw Exception("Produto não encontrado");
    }
    return CourseModel.fromMap(respondeData.fistr);
  }
}
