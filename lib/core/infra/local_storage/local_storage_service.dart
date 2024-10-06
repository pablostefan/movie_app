abstract class LocalStorageService {
  Future<Map<String, dynamic>?> get(String key);

  Future<bool> put(String key, Map<String, dynamic> value);
}
