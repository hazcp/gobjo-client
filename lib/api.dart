import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  Future<int> getData() async {
    http.Response response =
        await http.get('http://1aded5a5f5cc.ngrok.io/employers');
    final x = jsonDecode(response.body);
    return x.length;
  }
}

APIService apiService = APIService();
