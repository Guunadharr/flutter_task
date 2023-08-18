import 'package:http/http.dart' as http;
import 'dart:convert';

class DogImagesController {
  static Future<String> fetchRandomDogImage() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['message'];
    } else {
      throw Exception('Failed to load image');
    }
  }
}
