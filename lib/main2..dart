// import 'package:dio/dio.dart';
//
// class ApiRepository {
//   final Dio _dio = Dio();
//
//   // Base URL for API requests
//   final String _baseUrl = 'https://yourapi.com/api';
//
//   // Create
//   Future<Response> createPost(Map<String, dynamic> data) async {
//     try {
//       final response = await _dio.post('$_baseUrl/posts', data: data);
//       return response;
//     } catch (e) {
//       throw Exception('Failed to create post: $e');
//     }
//   }
//
//   // Read
//   Future<Response> getPosts() async {
//     try {
//       final response = await _dio.get('$_baseUrl/posts');
//       return response;
//     } catch (e) {
//       throw Exception('Failed to fetch posts: $e');
//     }
//   }
//
//   // Update
//   Future<Response> updatePost(int id, Map<String, dynamic> data) async {
//     try {
//       final response = await _dio.put('$_baseUrl/posts/$id', data: data);
//       return response;
//     } catch (e) {
//       throw Exception('Failed to update post: $e');
//     }
//   }
//
//   // Delete
//   Future<Response> deletePost(int id) async {
//     try {
//       final response = await _dio.delete('$_baseUrl/posts/$id');
//       return response;
//     } catch (e) {
//       throw Exception('Failed to delete post: $e');
//     }
//   }
// }
