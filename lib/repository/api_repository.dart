import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:todo_app/data/post_model.dart';

class ApiRepository {
  Dio _dio = Dio();

  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<PostModel>> getPost() async {
    try {
      final response = await _dio.get(_baseUrl + "posts");

      if (response.statusCode == 200) {
        var jsonList = response.data as List;

        List<PostModel> posts =
            jsonList.map((json) => PostModel.fromJson(json)).toList();
        return posts;
      } else {
        throw Exception('Failed to fetch posts.');
      }
    } catch (e) {
      throw Exception('Failed to fetch posts.$e');
    }
  }

  Future<PostModel> createPost(
      {required int id, required String title, required String body}) async {
    try {
      final Response response = await _dio.post(
        _baseUrl + "posts",
        data: jsonEncode({'title': title, 'body': body, 'userId': id}),
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      return PostModel.fromJson((response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<PostModel> editPost(int id, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put("${_baseUrl}posts/$id", data: data);

      if (response.statusCode == 200) {
        return PostModel.fromJson((response.data));
      } else {
        throw Exception('Failed to update posts.');
      }
    } catch (e) {
      throw Exception('Failed to update post.$e');
    }
  }

  Future<bool> deletPost(String id) async {
    try {
      final response = await _dio.delete("${_baseUrl}posts/$id");

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update posts.');
      }
    } catch (e) {
      throw Exception('Failed to update post.$e');
    }
  }
}
