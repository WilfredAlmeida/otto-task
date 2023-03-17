import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otto_task/views/screens/fullscreen_image.dart';
import 'package:otto_task/views/widgets/image_widget.dart';
import 'package:http/http.dart' as http;

class GalleryHomepageScreen extends StatefulWidget {
  const GalleryHomepageScreen({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  _GalleryHomepageScreenState createState() => _GalleryHomepageScreenState();
}

class _GalleryHomepageScreenState extends State<GalleryHomepageScreen> {
  final List<dynamic> _photos = [];
  int _page = 1;
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getPhotos();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getPhotos();
      }
    });
  }

  Future<void> _getPhotos() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/photos?page=$_page&per_page=10&client_id=K7jVlDTauoN42wwdqHvlJY7qE4wpnhp-iNpas-VUpbE',
      ),
    );

    setState(() {
      _photos.addAll(jsonDecode(response.body));
      _isLoading = false;
      _page++;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(8.0),
        itemCount: _photos.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          if (index == _photos.length) {
            return _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container();
          }
          final photo = _photos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImage(
                    key: Key(index.toString()),
                    imageUrl: photo['urls']['small'],
                  ),
                ),
              );
            },
            child: ImageCardWidget(
              imageUrl: photo['urls']['thumb'],
              isBookmarked: false,
            ),
          );
        },
      ),
    );
  }
}
