import 'dart:convert';

import 'package:camps_demo/models/card_data.dart';
import 'package:http/http.dart' as http;

import '../models/complete_card_data.dart';

class GetDataForCard {
  Future<CompleteCardData> getAll() async {
    const url = 'https://reqres.in/api/users?page=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
     
      final getCardData = CompleteCardData.fromJson(json);
      return getCardData;
      // List<CardModel> cardListData = [];
      // (json['data'] as List<CardModel>).forEach((element) {
      //   cardListData.add(element);
      // });
      //final result = json.map((e) {

      //   return CardModel(
      //       // first_name: e['first_name'],
      //       // last_name: e['last_name'],
      //       // id: e['id']);

      //   //return CardModel.fromJson(e.);
      // }).toList();
      /// return json['data'] as List<CompleteCardData>;
    } else {
      throw 'Something went wrong code ${response.statusCode}';
    }
  }
}
