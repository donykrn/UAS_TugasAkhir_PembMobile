import 'dart:convert';

import 'package:http/http.dart';
import 'package:uas_flutter/models/cases.dart';

class ApiService {
  final String apiUrl = "http://192.168.0.7:3000/api";

  Future<List<Cases>> getCases() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases =
          body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Gagal Memuat"
    }
  }

  Future<Cases> getCaseById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else{
      throw Exception('Gagal Memuat')
    }
  }

  Future<Cases> createCase(Cases cases) async {
    Map data = {
      'nama': cases.nama,
      'gender': cases.gender,
      'umur': cases.umur,
      'alamat': cases.alamat,
      'kota': cases.kota,
      'negara': cases.negara,
      'status': cases.status
    };

    final Response response = await post(apiUrl,
    headers: <String,, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal Memuat');
    }
  }

  Future<Cases> updateCases(String id, Cases cases) async {
    Map data = {
      'nama': cases.nama,
      'gender': cases.gender,
      'umur': cases.umur,
      'alamat': cases.alamat,
      'kota': cases.kota,
      'negara': cases.negara,
      'status': cases.status
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
