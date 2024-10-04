import 'package:movie_app/core/network/interface/network_status_interface.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatusImp implements NetworkStatus {
  @override
  Future<bool> get isConnected async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  Stream<bool> get onConnectionChanged {
    return Connectivity().onConnectivityChanged.map((result) {
      return !result.contains(ConnectivityResult.none);
    });
  }
}
