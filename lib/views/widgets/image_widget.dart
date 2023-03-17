import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCardWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  late  bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  ImageCardWidget({super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  State<ImageCardWidget> createState() => _ImageCardWidgetState();
}

class _ImageCardWidgetState extends State<ImageCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: IconButton(
                  icon: Icon(
                    widget.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    setState(() {
                      widget.isBookmarked = !widget.isBookmarked;
                    });

                    widget.onBookmarkToggle();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
