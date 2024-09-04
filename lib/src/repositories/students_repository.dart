import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/students_model.dart';

class StudentsRepository {
  Future<List<StudentModel>> findAll() async {
    final studentsResult =
        await http.get(Uri.parse('http://localhost:8080/students'));

    if (studentsResult.statusCode != 200) {
      throw Exception();
    }
    final studentsData = jsonDecode(studentsResult.body);

    return studentsData.map<StudentModel>((student) {
      return StudentModel.fromMap(student);
    }).toList();
  }

  Future<StudentModel> findById(int id) async {
    final studentResult =
        await http.get(Uri.parse('http://localhost:8080/students/$id'));

    if (studentResult.statusCode != 200) {
      throw Exception();
    }

    if (studentResult.body == "{}") {
      throw Exception();
    }
    return StudentModel.fromJson(studentResult.body);
  }

  Future<void> insert(StudentModel student) async {
    final response = await http.post(
        Uri.parse('http://localhost:8080/students'),
        body: student.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> update(StudentModel student) async {
    final response = await http.put(
        Uri.parse('http://localhost:8080/students/${student.id}'),
        body: student.toJson(),
        headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:8080/students/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
