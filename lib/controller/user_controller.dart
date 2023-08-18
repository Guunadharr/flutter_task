import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

class UserController {
  Future<UserData> fetchRandomUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode == 200) {
      return UserData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user details');
    }
  }
}
