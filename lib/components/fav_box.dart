import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/pdf_api.dart';
import '../page/pdf_viewer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavBox extends StatelessWidget {
  final RxBool _isfav = false.obs;
  final String id;
  final String title;
  final String author;
  final String url;
  final List<dynamic> favList;

  FavBox({
    Key key,
    @required this.title,
    @required this.author,
    this.url,
    @required this.id,
    @required this.favList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _checkIsFav();
    return InkWell(
      onTap: () {
        _openPDF();
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Obx(
              () => Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    child: _isfav.value == false
                        ? Icon(
                            Icons.favorite_outline,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                    onTap: () {
                      _isfav.value = !_isfav.value;
                      _clickFav(!_isfav.value);
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              child: Column(
                children: [
                  Text(title),
                  Text("by " + author,
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

  void _openPDF() async {
    if (url == null) return;
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    final file = await PDFApi.loadNetwork(url);
    Get.back();
    Get.to(PDFViewerPage(file: file));
  }

  Future<void> _checkIsFav() async {
    print("function _checkIsFav");
    if (favList == null) {
      _isfav.value = false;
      return;
    }
    var userID = FirebaseAuth.instance.currentUser.uid;
    if (favList.contains(userID)) {
      _isfav.value = true;
    } else {
      _isfav.value = false;
    }
  }

  _clickFav(bool isFav) async {
    await Firebase.initializeApp().then((value) async {
      var userID = FirebaseAuth.instance.currentUser.uid;
      print("itemID: $id");
      if (isFav == false) {
        try {
          await FirebaseFirestore.instance.collection("cheese").doc(id).update({
            "fav": FieldValue.arrayUnion([userID])
          });
        } catch (_) {}
      } else {
        try {
          await FirebaseFirestore.instance.collection("cheese").doc(id).update({
            "fav": FieldValue.arrayRemove([userID])
          });
        } catch (_) {}
      }

      //_checkIsFav();
      print(" _isfav.value = ${_isfav.value}");
    });
  }
}
