import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/fav_box.dart';
import '../models/cheese.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  final Rx<List<Cheese>> cheeses = Rx<List<Cheese>>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFC66C),
          title: Text("Search"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  onSubmitted: (search) {
                    if (search.isEmpty) {
                      cheeses.value.clear();
                    }
                  },
                  onChanged: (search) async {
                    if (search.isEmpty) {
                      cheeses.value.clear();
                    } else {
                      var result = await FirebaseFirestore.instance
                          .collection('cheese')
                          .where(
                            'title',
                            isGreaterThanOrEqualTo: search,
                            isLessThan: search.substring(0, search.length - 1) +
                                String.fromCharCode(
                                    search.codeUnitAt(search.length - 1) + 1),
                          )
                          .get();
                      cheeses.value = result.docs.map(
                        (data) {
                          return Cheese(
                              id: data.id,
                              author: data.data()['author'],
                              title: data.data()['title'],
                              url: data.data()['url'],
                              fav: data.data()['fav']);
                        },
                      ).toList();
                    }
                  },
                ),
                Expanded(
                  child: Obx(() {
                    return cheeses.value == null
                        ? SizedBox()
                        : GridView(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1 / 1.5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            children: List.generate(
                              cheeses.value.length,
                              (index) => FavBox(
                                id: cheeses.value[index].id,
                                title: cheeses.value[index].title,
                                author: cheeses.value[index].author,
                                url: cheeses.value[index].url,
                                favList: cheeses.value[index].fav,
                              ),
                            ),
                          );
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
