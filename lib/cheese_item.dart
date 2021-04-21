import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  const CategoryItem(this.id, this.title, this.author);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //     onTap: () => selectCategory(context),
    //     splashColor: Theme.of(context).primaryColor,
    //     borderRadius: BorderRadius.circular(15),
    //     child: Container(
    //       padding: EdgeInsets.all(5),
    //       decoration: BoxDecoration(
    //         image: DecorationImage(image: AssetImage('images/test.jpg')),
    //       ),
    //     ));

    return InkWell(
      onTap: () => print(context),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(id),
            Text(title),
            Text("by " + author, style: TextStyle(color: Color(0xFFFF6E37)))
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xFFFFC66C),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.red, width: 7)),
      ),
    );
  }
}
