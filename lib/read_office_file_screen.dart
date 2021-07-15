import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadOfficeFileScreen extends StatefulWidget {
  ReadOfficeFileScreen({required this.urlOffice, this.title});
  final String urlOffice;
  final String? title;
  @override
  State<StatefulWidget> createState() => ReadOfficeFileScreenState();
}

class ReadOfficeFileScreenState extends State<ReadOfficeFileScreen> {
  String? url;
  @override
  void initState() {
    super.initState();
    this.url="https://docs.google.com/gview?embedded=true&url="+widget.urlOffice;
    print("URL: "+this.url!);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          widget.title??"",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey[800],
          onPressed: () => Navigator.pop(context),
          iconSize: 24.0,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: WebView(
        initialUrl: url!,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
