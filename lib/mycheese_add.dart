import 'package:flutter/material.dart';
import 'add_image.dart';

class MyCheeseAdd extends StatefulWidget {
  @override
  _MyCheeseAddState createState() => _MyCheeseAddState();
}

class _MyCheeseAddState extends State<MyCheeseAdd> {
  String _chosenValue;
  String _chosenValue2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
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
                              child: Text("Default"),
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
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddImage()),
                            ),
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
                        flex: 2,
                        child: Container(
                            margin:
                                EdgeInsets.only(left: 30, top: 20, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Category",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: DropdownButton<String>(
                                        focusColor: Colors.white,
                                        value: _chosenValue,
                                        //elevation: 5,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          'ALL',
                                          'IT',
                                          'CS',
                                          'DSI',
                                          'GEN'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Choose a Category",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _chosenValue = value;
                                          });
                                        },
                                      ),
                                    ))
                              ],
                            ))),
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
                                    "Year",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: DropdownButton<String>(
                                        focusColor: Colors.white,
                                        value: _chosenValue2,
                                        //elevation: 5,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Colors.black,
                                        items: <String>[
                                          '1',
                                          '2',
                                          '3',
                                          '4',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Choose a Year",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _chosenValue = value;
                                          });
                                        },
                                      ),
                                    ))
                              ],
                            ))),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(flex: 3, child: Center(child: Text('OK')))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
