import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:t_store/utils/http/endpoints.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class THttpHelper {
  // Initialize logger
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  // Helper method to get token
  static Future<String?> getToken() async {
    return await TLocalStorage().readData("access_token");
  }

  // Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('${Endpoints.BASE_URL}$endpoint');
    _logger.i('🌐 GET Request: $url');

    try {
      final token = await getToken();
      final headers = token != null
          ? {'Authorization': 'Bearer $token'}
          : <String, String>{};

      final response = await http.get(url, headers: headers);
      return _handleResponse(response, 'GET', endpoint);
    } catch (e) {
      _logger.e('❌ GET Request Error: ${e.toString()}');
      rethrow;
    }
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final url = Uri.parse('${Endpoints.BASE_URL}$endpoint');
    _logger.i('🌐 POST Request: $url');
    _logger.d('📦 Request Body: ${json.encode(data)}');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await getToken() ?? ""}',
        },
        body: json.encode(data),
      );
      return _handleResponse(response, 'POST', endpoint);
    } catch (e) {
      _logger.e('❌ POST Request Error: ${e.toString()}');
      rethrow;
    }
  }

  // Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final url = Uri.parse('${Endpoints.BASE_URL}$endpoint');
    _logger.i('🌐 PUT Request: $url');
    _logger.d('📦 Request Body: ${json.encode(data)}');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await getToken() ?? ""}',
        },
        body: json.encode(data),
      );
      return _handleResponse(response, 'PUT', endpoint);
    } catch (e) {
      _logger.e('❌ PUT Request Error: ${e.toString()}');
      rethrow;
    }
  }

  // Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final url = Uri.parse('${Endpoints.BASE_URL}$endpoint');
    _logger.i('🌐 DELETE Request: $url');

    try {
      final token = await getToken();
      final headers = token != null
          ? {'Authorization': 'Bearer $token'}
          : <String, String>{};

      final response = await http.delete(url, headers: headers);
      return _handleResponse(response, 'DELETE', endpoint);
    } catch (e) {
      _logger.e('❌ DELETE Request Error: ${e.toString()}');
      rethrow;
    }
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(
      http.Response response, String method, String endpoint) {
    _logger.d('📊 Response Status: ${response.statusCode}');

    // Log only a preview of the response body if it's too large
    final responsePreview = response.body.length > 500
        ? '${response.body.substring(0, 500)}... (truncated)'
        : response.body;
    _logger.d('📄 Response Body: $responsePreview');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      _logger.i('✅ $method Request to $endpoint Successful');
      var cleanedData = json.decode(response.body);

      if (cleanedData is Map<String, dynamic>) {
        return cleanedData;
      }
      return {"data": cleanedData};
    } else {
      _logger
          .e('❌ $method Request to $endpoint Failed (${response.statusCode})');

      try {
        var decodedBody = json.decode(response.body);
        if (decodedBody is Map<String, dynamic>) {
          var message = decodedBody['message'] ?? 'Unknown error';
          _logger.e('❌ Error Message: $message');
          throw Exception(message);
        }
      } catch (e) {
        _logger.e('❌ Could not parse error response: ${e.toString()}');
      }

      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  // Enable/disable detailed logging (for production builds, you might want to disable it)
  static void setVerboseLogging(bool verbose) {}
}
