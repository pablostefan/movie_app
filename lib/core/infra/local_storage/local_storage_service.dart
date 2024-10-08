abstract class LocalStorageService {
  Future<Map<String, dynamic>?> getData(String key);

  Future<String?> getString(String key);

  Future<bool> putData(String key, Map<String, dynamic> value);

  Future<bool> putString(String key, String value);
}
