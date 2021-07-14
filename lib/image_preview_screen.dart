import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String urlImage;
  ImagePreviewScreen({required this.urlImage});
  @override
  State<StatefulWidget> createState() => ImagePreviewScreenState();
}

class ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: PhotoView(
        imageProvider: NetworkImage(
            "https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI"),
      ),
    );
  }
}
