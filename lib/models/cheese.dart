import 'dart:ffi';

List<Cheese> myEventList;

class Cheese {
  final String title;
  final String url;
  final String program;
  final String year;
  final String author;
  final String uid;
  final String id;
  final List fav;

  Cheese(
      {this.title,
      this.url,
      this.program,
      this.year,
      this.author,
      this.uid,
      this.id,
      this.fav});
}
