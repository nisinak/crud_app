import 'package:todo_app/data/post_model.dart';
import 'package:todo_app/repository/api_repository.dart';

class PostRepository {
  final ApiRepository apiRepository;

  PostRepository(this.apiRepository);

  Future<List<PostModel>> fetchPost() => apiRepository.getPost();

  Future<PostModel> createPost(
      {required int id, required String title, required String body}) {
    return apiRepository.createPost(id: id, title: title, body: body);
  }

  Future<PostModel> updatePost({required int id, required data}) {
    return apiRepository.editPost(id, data);
  }
  Future<bool> deletPost({required String id,}) {
    return apiRepository.deletPost(id);
  }
}



