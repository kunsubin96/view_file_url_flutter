import 'package:flutter/material.dart';
import 'package:view_file_url_flutter/image_preview_screen.dart';
import 'package:view_file_url_flutter/read_office_file_screen.dart';
import 'package:view_file_url_flutter/read_pdf_screen.dart';
import 'package:view_file_url_flutter/video_player_screen.dart';
import 'package:view_file_url_flutter/youtube_player_screen.dart';
import 'package:view_file_url_flutter/youtube_player_screen1.dart';

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

  String urlDoc="https://file-examples-com.github.io/uploads/2017/02/file-sample_100kB.doc";
  String urlDocx="https://file-examples-com.github.io/uploads/2017/02/file-sample_500kB.docx";
  String urlPPT="https://file-examples-com.github.io/uploads/2017/08/file_example_PPT_250kB.ppt";

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
            ElevatedButton(
              onPressed: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                            urlVideo: videoUrl,
                          ))),
              child:  Text("Play Video",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0)),
                  shape:  MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              )),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReadPdfScreen(
                            urlPdf: pdfUrl,
                          ))),
              child:  Text("Read pdf",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0)),
                  shape:  MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              )),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImagePreviewScreen(
                            urlImage: urlImage,
                          ))),
              child:  Text("Image Preview",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0)),
                  shape:  MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReadOfficeFileScreen(urlOffice: urlPPT))),
              child:  Text("Read office file",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0)),
                  shape:  MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YoutubePlayerScreen())),
              child:  Text("Youtube Player",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0)),
                  shape:  MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: ()=> Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YoutubePlayerScreen1(urlYoutube: "https://www.youtube.com/watch?v=Pi6b2GthO08",))),
              child:  Text("Youtube Player 1",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 40.0, left: 40.0)),
                  shape:  MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.blue))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
            )
          ],
        ),
      ),
    );
  }
}
