import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:csc234_project_cheese/dummy_data.dart';
import 'package:csc234_project_cheese/cheese_item.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    Future<List<Post>> search(String search) async {
      await Future.delayed(Duration(seconds: 2));
      return List.generate(search.length, (int index) {
        return Post(
          "Title : $search $index",
          "Description :$search $index",
        );
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SearchBar(
              onSearch: search,
            ),
          ),
        ));
  }
}
