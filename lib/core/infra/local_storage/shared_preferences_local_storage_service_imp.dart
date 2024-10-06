import 'dart:convert';

import 'package:movie_app/core/infra/local_storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorageService implements LocalStorageService {
  SharedPreferencesLocalStorageService();

  @override
  Future<Map<String, dynamic>?> get(String key) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final String? data = sharedPreferences.getString(key);
      return jsonDecode(data ?? '');
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> put(String key, Map<String, dynamic> value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String data = jsonEncode(value);
    return await sharedPreferences.setString(key, data);
  }

  @override
  Future<bool> clear() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.clear();
  }
}
