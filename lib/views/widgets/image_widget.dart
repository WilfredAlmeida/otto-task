import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

//Image card widget
class ImageCardWidget extends StatefulWidget {
  final String imageUrl;
  late bool isBookmarked;

  ImageCardWidget({
    super.key,
    required this.imageUrl,
    required this.isBookmarked,
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
              //Cached network image to provide local caching
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: IconButton(
                  icon: Icon(
                    //icon decided by toggle status
                    widget.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //Toggle bookmark control variable
                    setState(() {
                      widget.isBookmarked = !widget.isBookmarked;
                    });
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
