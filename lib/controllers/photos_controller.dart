import 'package:http/http.dart' as http;

class PhotosController{
  static Future<String> getUnsplashPhotos(int page) async {

    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/photos?page=$page&per_page=10&client_id=K7jVlDTauoN42wwdqHvlJY7qE4wpnhp-iNpas-VUpbE',
      ),
    );

    return response.body;
  }
}