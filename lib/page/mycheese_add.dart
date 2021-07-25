import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:uuid/uuid.dart';

class MyCheeseAdd extends StatefulWidget {
  @override
  _MyCheeseAddState createState() => _MyCheeseAddState();
}

class _MyCheeseAddState extends State<MyCheeseAdd> {
  final myController = TextEditingController();
  String _chosenValue;
  String _chosenValue2;
  File file;
  firebase_storage.Reference ref;
  CollectionReference imgRef;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? Path.basename(file.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC66C),
        title: Text("Add New Cheese"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => print(context),
                            child: Container(
                              height: 250,
                              width: 167,
                              child: Text("$fileName"),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFC66C),
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: Color(0xFFFF6E37), width: 9)),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              selectFile();
                            },
                            child: Container(
                              height: 250,
                              width: 167,
                              child: Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFC4C4C4),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    border: Border.all(color: Color(0xFFC4C4C4))),
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            margin:
                                EdgeInsets.only(left: 30, top: 20, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Subject",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: TextField(
                                          controller: myController,
                                          decoration: new InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                new EdgeInsets.all(10.0),
                                            border: OutlineInputBorder(),
                                          ),
                                          keyboardType: TextInputType.text,
                                        )))
                              ],
                            ))),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                        flex: 3,
                        child: Center(
                            child: FlatButton(
                          onPressed: () {
                            uploadFile().whenComplete(
                                () => Navigator.of(context).pop());
                            ;
                          },
                          child: Text('OK'),
                        )))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    var uuid = Uuid();
    var v1 = uuid.v1();
    ref = firebase_storage.FirebaseStorage.instance.ref().child('images/${v1}');
    await ref.putFile(file).whenComplete(() async {
      await ref.getDownloadURL().then((value) {
        final User user = auth.currentUser;
        final uid = user.uid;
        final title = Text(myController.text);
        final username = user.displayName;
        imgRef.add({
          'author': username,
          'url': value,
          'user': uid,
          'title': title.data,
          'fav': []
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('cheese');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}
