import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/post_event.dart';
import 'package:todo_app/bloc/post_state.dart';

import '../bloc/post_bloc.dart';
import 'edit_post.dart';

class EditPost extends StatelessWidget {
  int id;
  String userId;
  String title;
  String description;

  EditPost(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController(text: title);
    TextEditingController _descriptionController =
        TextEditingController(text: description);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "userId : $userId",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Id : $id",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20,),
                  todoItem(_titleController, "Todo Title"),
                  todoItem(_descriptionController, "Description"),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PostBloc>(context)
                      .add(EditPostEvent(id: id, updatedData: {
                    'title': _titleController.text,
                    'body': _descriptionController.text,
                    'userId': userId,
                    'id': id,
                  }));



                },
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BlocBuilder<PostBloc, PostState>(
                        builder: (context, state) {
                      if (state is EditLoading) {
                        return const Center(
                            child: CircularProgressIndicator(
                                color: Colors.yellow));
                      }
                      return const Text(
                        "Update",
                        style: TextStyle(fontSize: 22),
                      );
                    }))),
          ),
        ],
      ),
    );
  }
}

Widget todoItem(TextEditingController controller, String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title),
      SizedBox(
        width: 10,
      ),
      Expanded(
          child: TextField(
        controller: controller,
        maxLines: null,
        style: TextStyle(fontSize: 14),
      )),
    ],
  );
}
