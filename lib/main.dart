import 'package:flutter/material.dart';
import 'package:otto_task/views/screens/gallery_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GalleryHomepageScreen(title: 'Photo Gallery'),
    );
  }
}

