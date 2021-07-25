import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc234_project_cheese/models/cheese.dart';
import 'package:csc234_project_cheese/page/pdf_viewer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:csc234_project_cheese/controllers/pdf_api.dart';

class CategoryItem extends StatefulWidget {
  final String program;
  final String title;
  final String author;
  final String year;
  final String pdfurl;
  final String id;
  final List favlist;

  const CategoryItem(this.program, this.year, this.title, this.author,
      this.pdfurl, this.id, this.favlist);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isfav = false;
  Future<void> checkIsFav() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) async {
        if (widget.favlist.contains(event.uid)) {
          isfav = true;
        } else {
          isfav = false;
        }
        ;
      });
    });
  }

  clickFav() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) async {
        print('hellooooooo');
        if (isfav == false) {
          try {
            await FirebaseFirestore.instance
                .collection("cheese")
                .doc(widget.id)
                .update({
              "fav": FieldValue.arrayUnion(["${event.uid}"])
            });
          } catch (e) {
            print('hiiiiiii        $e');
          }
          ;
        } else {
          try {
            await FirebaseFirestore.instance
                .collection("cheese")
                .doc(widget.id)
                .update({
              "fav": FieldValue.arrayRemove(["${event.uid}"])
            });
          } catch (e) {
            print('hiiiiiii        $e');
          }
        }
        checkIsFav();
      });
    });
  }

  @override
  void initState() {
    checkIsFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));

    return InkWell(
      onTap: () async {
        final url = widget.pdfurl;
        print(url);
        final file = await PDFApi.loadNetwork(url);
        openPDF(context, file);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  child: isfav == false
                      ? Icon(
                          Icons.favorite_outline,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                  onTap: () {
                    clickFav();
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Column(
                children: [
                  Text('${widget.program}#${widget.year}'),
                  Text(widget.title),
                  Text("by " + widget.author,
                      style: TextStyle(color: Color(0xFFFF6E37)))
                ],
              ),
            )
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
