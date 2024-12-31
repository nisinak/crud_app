import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/post_event.dart';
import 'package:todo_app/bloc/post_state.dart';
import 'package:todo_app/data/post_model.dart';

import '../repository/respository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<FetchEvent>(_fetchProducts);
    on<CreatePostEvent>(_createPost);
    on<SearchByIdEvent>(_searchPostById);
    on<EditPostEvent>(_updatePost);
    on<DeletePostEvent>(_deletePost);
  }

  List<PostModel> posts = [];

  Future<void> _fetchProducts(FetchEvent event, Emitter<PostState> emit) async {
    emit(PostLoadding());

    try {
      posts = await postRepository.fetchPost();
      emit(PostLoaded(listPost: posts.reversed.toList()));
    } catch (e) {
      emit(PostError("Failed to load posts $e"));
    }
  }

  Future<void> _createPost(CreatePostEvent event,
      Emitter<PostState> emit) async {
    try {
      PostModel post = await postRepository.createPost(
          id: event.id, title: event.title, body: event.body);
      emit(PostLoadding());

      posts.add(post);
      emit(PostLoaded(listPost: posts.reversed.toList()));
      print(posts.length);
    } catch (e) {
      emit(PostCreationErrorState("$e"));
    }
  }

  Future<void> _searchPostById(SearchByIdEvent event,
      Emitter<PostState> emit) async {
    var currentState = state;
    try {
      if (currentState is PostLoaded) {
        List<PostModel> filterList =
        posts.where((post) => post.userId.toString() == event.id).toList();
        emit(PostLoaded(listPost: filterList));
      }
    } catch (e) {
      emit(PostError("Failed to load posts $e"));
    }
  }

  Future<void> _updatePost(EditPostEvent event, Emitter<PostState> emit) async {
    emit(EditLoading());
    try {
      PostModel updatedPost = await postRepository.updatePost(
          id: event.id, data: event.updatedData);

      List<PostModel> updatedList = posts
          .map((post) => post.id == event.id ? updatedPost : post)
          .toList();

      emit(PostLoaded(listPost: posts.reversed.toList(),isFromEdit: true));

      print(posts.length);
    } catch (e) {
      emit(PostEditError("$e"));
    }
  }

  Future<void> _deletePost(DeletePostEvent event,
      Emitter<PostState> emit) async {
    emit(PostLoadding());
    try {
      bool isDeledted = await postRepository.deletPost(
          id: event.id
      );
      if (isDeledted) {
        posts.removeWhere((item) => item.id.toString() == event.id);
        emit(PostLoaded(listPost: posts.reversed.toList()));

            print(posts.length);
      }
    } catch (e) {
      emit(PostError("Failed to load posts $e"));
    }
  }
}
