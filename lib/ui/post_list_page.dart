import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/post_bloc.dart';
import 'package:todo_app/bloc/post_event.dart';
import 'package:todo_app/bloc/post_state.dart';

import 'post_item.dart';

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            autofocus: false,
            onSubmitted: (String value) {
              if (value.isNotEmpty) {
                context.read<PostBloc>().add(SearchByIdEvent(id: value));
              } else {
                context.read<PostBloc>().add(FetchEvent());
              }
            },
            decoration: InputDecoration(
              labelText: 'Search for your task',
              labelStyle: TextStyle(fontSize: 14, color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(6),
              ),
              contentPadding: const EdgeInsets.only(top: 0, left: 25),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoadding) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.yellow));
                }
              else if (state is PostLoaded) {
                  return ListView.builder(
                      itemCount: state.listPost.length,
                      itemBuilder: (context, index) {
                        return PostItem(
                            userId:
                                state.listPost[index].userId.toString() ?? "0",
                            id: state.listPost[index].id ?? 0,
                            title: state.listPost[index].title ?? "",
                            description: state.listPost[index].body ?? "");
                      });
                } else if (state is PostLoaded) {
                  if (state.listPost.isEmpty) {
                    return const Center(
                      child: Text("No Posts Found"),
                    );
                  }
                } else if (state is PostError) {
                  return Center(child: Text(state.error));
                }
                return const Center(
                  child: Text("No data available"),
                );
              },
            ),
          )
        ]));
  }
}
