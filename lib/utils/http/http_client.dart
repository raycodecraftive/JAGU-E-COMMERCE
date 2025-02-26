import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:t_store/utils/http/endpoints.dart';

class THttpHelper {
  // Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response =
        await http.get(Uri.parse('${Endpoints.BASE_URL}$endpoint'));
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final url = Uri.parse('${Endpoints.BASE_URL}$endpoint');
    print('Making POST request to: $url');
    print('Request body: ${json.encode(data)}');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('${Endpoints.BASE_URL}$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response =
        await http.delete(Uri.parse('${Endpoints.BASE_URL}$endpoint'));
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      var decodedBody = json.decode((response.body));
      if (decodedBody is Map<String, dynamic>) {
        var message = decodedBody['message'] ?? 'Unknown error';
        throw Exception(message);
      }
      throw Exception('Unknown error');
    }
  }
}
