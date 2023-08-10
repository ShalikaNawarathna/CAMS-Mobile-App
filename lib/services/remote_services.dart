import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import "../models/post.dart";

class RemotesService {
//   late String stringResponse;
//   Future<List<Post>?> getPosts() async {
//     var client = http.Client();
//     var uri = Uri.parse('https://reqres.in/api/users/2');
//     var response = await http.get(uri);

//     if (response.statusCode == 200) {
//       stringResponse = json.decode(response.body);
//       postFromJson(stringResponse);
//     }
//     print(stringResponse);
//   }
  static final RemotesService _instance = RemotesService._internal();

  factory RemotesService() {
    return _instance;
  }
  RemotesService._internal();

  Future<void> login(String email, String password) async {
    try {
      Response response = await get(
        Uri.parse('https://reqres.in/api/users/2'),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        print('Login successful');
      } else {
        print('Login failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
