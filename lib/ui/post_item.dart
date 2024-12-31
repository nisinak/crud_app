import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/post_bloc.dart';
import 'package:todo_app/bloc/post_event.dart';

import 'edit_post.dart';

class PostItem extends StatelessWidget {
  String userId;
  int id;
  String title;
  String description;

  PostItem(
      {required this.userId,
      required this.id,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditPost(
                id: id, userId: userId, title: title, description: description),
          ),
        );
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Delete Post"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        context
                            .read<PostBloc>()
                            .add(DeletePostEvent(id: id.toString()));
                        Navigator.pop(context);
                      },
                      child: Text("Delete")),
                ],
              );
            });
      },
      child: Card(
        margin: EdgeInsets.all(6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const Radio(value: false, groupValue: true, onChanged: null),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "userId :${userId.toString()}",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Id :${ id.toString()}",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                          child: Text(description,
                              style: TextStyle(fontSize: 12))),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text("Home"),
                        color: Colors.orange,
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
