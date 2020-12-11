import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

//void main() => runApp(MyApps());

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  String pdf = "";
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    PDFDocument doc = await PDFDocument.fromAsset(pdf);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter PDF Demo"),),
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc,
        indicatorBackground: Colors.red,
      ),
    );
  }
}