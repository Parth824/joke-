import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as ht;
import 'package:jokeapp/model/jok.dart';

class api_helper {
  api_helper._();

  static final api_helper helper = api_helper._();

  List<String> jokes_data = [];

   Future<joka?> getapi() async {
    String koma = "https://api.chucknorris.io/jokes/random";

    ht.Response response = await ht.get(Uri.parse(koma));

    if (response.statusCode == 200) {
      Map k = json.decode(response.body);

      joka data = joka.formjson(data: k);

      return data;
    }
  }
}
