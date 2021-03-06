import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PDFApi {
  static Future<File> loadFirebase(String url) async {
    try {
      final refPDF = FirebaseStorage.instance.ref().child('images').child(url);
      final bytes = await refPDF.getData();

      return _storeFile(url, bytes);
    } catch (e) {
      return null;
    }
  }

  static Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
