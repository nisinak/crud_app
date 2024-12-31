import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repository/api_repository.dart';
import 'package:todo_app/repository/respository.dart';

import 'bloc/post_bloc.dart';
import 'bloc/post_event.dart';
import 'ui/post_bottom_sheet.dart';
import 'ui/post_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(PostRepository(ApiRepository())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home:  HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    PostListPage(),
    Text("second"),
    Text("3"),
    PostListPage()
  ];

  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchEvent());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    apiRepository.getPost();
    print("here");
  }

  ApiRepository apiRepository = ApiRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text("TODO APP",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Icon(
            Icons.menu,
            size: 25,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 20),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              child: Icon(
                Icons.person,
                size: 25,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (builder) {
                return BlocProvider.value(
                    value: BlocProvider.of<PostBloc>(context),
                    child: const TodoBottomSheet());
              });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Color(0xff363636),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Posts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_note_outlined), label: "Post"),
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add_outlined), label: "My Posts"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}

