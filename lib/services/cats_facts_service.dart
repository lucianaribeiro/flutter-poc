import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:flutter_poc/models/fact_model.dart';

class CatsFactsService {
  final http.Client client;

  CatsFactsService(this.client);

  Future<Fact> fetchCatFact() async {
    final uri = Uri.parse('https://catfact.ninja/fact');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      return Fact.fromJson(jsonData);
    } else {
      throw Error();
    }
  }
}
