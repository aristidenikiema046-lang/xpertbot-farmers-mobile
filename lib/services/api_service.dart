import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/farmer.dart';

class ApiService {
  // Correction : un seul point-virgule ici
  static const String baseUrl = "http://192.168.1.16:8000/api";

  Future<List<Farmer>> fetchFarmers() async {
    final response = await http.get(Uri.parse('$baseUrl/farmers'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Farmer.fromJson(data)).toList();
    } else {
      throw Exception('Erreur lors du chargement des fermiers');
    }
  }
}