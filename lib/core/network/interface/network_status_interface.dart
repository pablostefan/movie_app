abstract interface class NetworkStatus {
  Future<bool> get isConnected;

  Stream<bool> get onConnectionChanged;
}
