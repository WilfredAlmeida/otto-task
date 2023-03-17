import 'package:http/http.dart' as http;

// Controller for Photos, has utility functions for data operations w.r.t. photos
class PhotosController{

  //Controller function to get data from Unsplash
  static Future<String> getUnsplashPhotos(int page) async {

    // Getting paginated response from Unsplash API
    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/photos?page=$page&per_page=10&client_id=K7jVlDTauoN42wwdqHvlJY7qE4wpnhp-iNpas-VUpbE',
      ),
    );

    return response.body;
  }
}