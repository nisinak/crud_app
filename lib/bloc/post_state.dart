import 'package:equatable/equatable.dart';
import 'package:todo_app/data/post_model.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoadding extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> listPost;

  bool isFromEdit = false;

  PostLoaded({required this.listPost, this.isFromEdit = false});

  @override
  List<Object?> get props => [listPost];
}

class PostError extends PostState {
  final String error;

  PostError(this.error);

  @override
  List<Object?> get props => [error];
}

class PostCreatedState extends PostState {
  final Map<String, dynamic> post;

  PostCreatedState(this.post);

  @override
  List<Object?> get props => [post];
}

class PostCreationErrorState extends PostState {
  final String error;

  PostCreationErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class PostSearchResultState extends PostState {
  final List<PostModel> listPost;

  PostSearchResultState({required this.listPost});

  @override
  List<Object?> get props => [listPost];
}

class EditLoading extends PostState {}

class PostEditLoaded extends PostState {
  final PostModel postModel;

  PostEditLoaded({required this.postModel});

  @override
  List<Object?> get props => [postModel];
}

class PostEditError extends PostState {
  final String error;

  PostEditError(this.error);

  @override
  List<Object?> get props => [error];
}
