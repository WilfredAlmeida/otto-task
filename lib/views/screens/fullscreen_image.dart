import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

//Fullscreen image view screen
class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Center(
          child: PhotoView(
            key: key,
            imageProvider: NetworkImage(imageUrl),
            loadingBuilder: (context, event) => const Center(
              child: CircularProgressIndicator(),
            ),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
          ),
        ),
      ),
    );
  }
}