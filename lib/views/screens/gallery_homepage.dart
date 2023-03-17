//Main gallery page
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otto_task/controllers/photos_controller.dart';
import 'package:otto_task/views/screens/fullscreen_image.dart';
import 'package:otto_task/views/widgets/appbar.dart';
import 'package:otto_task/views/widgets/image_widget.dart';

class GalleryHomepageScreen extends StatefulWidget {
  const GalleryHomepageScreen({Key? key})
      : super(key: key);
  @override
  _GalleryHomepageScreenState createState() => _GalleryHomepageScreenState();
}

class _GalleryHomepageScreenState extends State<GalleryHomepageScreen> {
  final List<dynamic> _photos = []; //List of photos
  int _page = 1; //page count used to fetch paginated responses from API
  bool _isLoading = false;

  //Scroll controller for gridview
  //Has method implementations to detect scrolling and trigger functions
  //Fetches more images when user scrolls to end of screen here
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _getPhotos(); // Initial loading of photos

    // Listener for scroll, loads more pictures when user scrolls to end of screen
    //This created infinite scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getPhotos();
      }
    });
  }

  //This function interacts with controllers and fetches and makes data available
  //In this case it fetches data from the Unsplash API Controller
  Future<void> _getPhotos() async {
    setState(() {
      _isLoading = true;
    });

    //Getting paginated data from the Unsplash API
    final response = await PhotosController.getUnsplashPhotos(_page);

    setState(() {
      _photos.addAll(jsonDecode(response));
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
      extendBodyBehindAppBar: false,
      appBar: GalleryAppbar, //Reusable Appbar widget

      //Main gallery gridview
      body: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(8.0),
        itemCount: _photos.length + 1, //here the additional tile shows loading until more images are fetched

        //grid styling
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {

          //Show loader if data is being loaded
          if (index == _photos.length) {
            return _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container();
          }
          final photo = _photos[index];
          return GestureDetector(
            //Showing fullscreen image when clicked
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
