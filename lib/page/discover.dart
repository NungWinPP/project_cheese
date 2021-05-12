import 'package:csc234_project_cheese/models/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:csc234_project_cheese/components/cheese_item.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
      ),
      // body: Center(
      //     child: Container(
      //   margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      //   color: Colors.red,
      // )),
      body: GridView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.id, catData.title, catData.author))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
