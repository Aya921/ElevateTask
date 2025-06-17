import 'package:taskelevate/data/models/productmodel.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract interface class RemoteData {
  Future<List<Productmodel>> fetchData();
}

class RemoteDataimp implements RemoteData{
  @override
  Future<List<Productmodel>> fetchData() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data.map((product) => Productmodel.fromJson(product)).toList();
    } else {
      throw Exception("Failed");
    }
  }

}