import 'package:csc234_project_cheese/dummy_mycheese.dart';
import 'package:flutter/material.dart';
import 'package:csc234_project_cheese/cheese_item.dart';
import 'package:csc234_project_cheese/add_image.dart';
import '../mycheese_add.dart';

class MyCheese extends StatefulWidget {
  @override
  _MyCheeseState createState() => _MyCheeseState();
}

class _MyCheeseState extends State<MyCheese> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cheese"),
      ),
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
      floatingActionButton: Transform.scale(
          scale: 1.1,
          child: FloatingActionButton(
            backgroundColor: Color(0xFFFF6E37),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCheeseAdd()),
              );
            },
          )),
    );
  }
}
