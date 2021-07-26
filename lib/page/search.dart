// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:csc234_project_cheese/models/cheese.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:csc234_project_cheese/models/dummy_data.dart';
// import 'package:csc234_project_cheese/components/cheese_item.dart';

// class Search extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     Future<List<Post>> search(String search) async {
//       print("search: $search");
//       var result = await FirebaseFirestore.instance
//           .collection('cheese')
//           .where(
//             'title',
//             isGreaterThanOrEqualTo: search,
//             isLessThan: search.substring(0, search.length - 1) +
//                 String.fromCharCode(search.codeUnitAt(search.length - 1) + 1),
//           )
//           .get();
//       List<Cheese> cheeses = [];
//       print("length result ${result.docs.length}");

//       result.docs.forEach((cheese) {
//         var data = cheese.data();
//         cheeses.add(Cheese(author: data['author'], title: data['title']));
//         print(data['author']);
//       });

//       return List.generate(3, (int index) {
//         return Post(
//           "Title : sdsd",
//           "Description : dsdsd",
//         );
//       });
//     }

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFFFFC66C),
//           title: Text("Search"),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: SearchBar(
//               onSearch: search,
//               onItemFound: (Post item, int index) {},
//             ),
//           ),
//         ));
//   }
// }
