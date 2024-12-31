import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/post_event.dart';

import '../bloc/post_bloc.dart';

class TodoBottomSheet extends StatelessWidget {
  const TodoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController(text: "");
    TextEditingController _descriptionController =
        TextEditingController(text: "");
    return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 15,
            left: 8,
            right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Task",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
             TextField(
              controller:_titleController,
                decoration: const InputDecoration(
                    labelText: "Task Title", border: OutlineInputBorder())),
            const SizedBox(
              height: 5,
            ),
             TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                  labelText: "Description", border: OutlineInputBorder()),
              maxLines: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<PostBloc>().add(CreatePostEvent(
                        id: 1,
                        title: _titleController.text,
                        body: _descriptionController.text));
                    Navigator.pop(context);

                  },
                  child: const Text("Add")),
            )
          ],
        ));
  }
}
