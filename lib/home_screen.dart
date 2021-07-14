import 'package:flutter/material.dart';
import 'package:view_file_url_flutter/image_preview_screen.dart';
import 'package:view_file_url_flutter/read_pdf_screen.dart';
import 'package:view_file_url_flutter/video_player_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  String pdfUrl = "http://www.pdf995.com/samples/pdf.pdf";
  String urlImage =
      "https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View file url flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Play Video",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                            urlVideo: videoUrl,
                          ))),
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue)),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text("Read pdf",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReadPdfScreen(
                            urlPdf: pdfUrl,
                          ))),
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue)),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              child: Text("Image Preview",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImagePreviewScreen(
                            urlImage: urlImage,
                          ))),
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
