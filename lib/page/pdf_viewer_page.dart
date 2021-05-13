import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({Key key, @required this.file}) : super(key: key);
  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Color(0xFFFFC66C),
        ),
        body: PDFView(
          filePath: widget.file.path,
        ));
  }
}
