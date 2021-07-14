import 'package:flutter/material.dart';
import 'package:view_file_url_flutter/home_screen.dart';

void main() {
  runApp(RootApplication());
}

class RootApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}


