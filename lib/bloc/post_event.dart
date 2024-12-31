import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchEvent extends PostEvent {}

class CreatePostEvent extends PostEvent {
  final int id;
  final String title;
  final String body;

  CreatePostEvent({required this.id, required this.title, required this.body});
}

class SearchByIdEvent extends PostEvent {
  final String id;

  SearchByIdEvent({
    required this.id,
  });
}

class EditPostEvent extends PostEvent {
  final int id;
  Map<String, dynamic> updatedData;

  EditPostEvent({required this.id, required this.updatedData});
}

class DeletePostEvent extends PostEvent {
  final String id;

  DeletePostEvent({required this.id});
}
