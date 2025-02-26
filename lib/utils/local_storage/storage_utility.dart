import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save data securely
  Future<void> saveData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Read data securely
  Future<String?> readData(String key) async {
    return await _storage.read(key: key);
  }

  // Remove data securely
  Future<void> removeData(String key) async {
    await _storage.delete(key: key);
  }

  // Clear all secure storage data
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

/// *** *** *** *** *** Example *** *** *** *** *** ///

// final localStorage = TLocalStorage();
//
// // Save data securely
// await localStorage.saveData('username', 'JohnDoe');
//
// // Read data securely
// String? username = await localStorage.readData('username');
// print('Username: $username'); // Output: Username: JohnDoe
//
// // Remove data securely
// await localStorage.removeData('username');
//
// // Clear all secure storage data
// await localStorage.clearAll();
