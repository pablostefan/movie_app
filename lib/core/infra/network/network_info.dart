abstract class NetworkInfo {
  Stream<bool> get onConnectivityChanged;

  Future<bool> get hasConnectivity;
}
