import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movie_app/core/network/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl(this._connectivity);

  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map((event) => !event.contains(ConnectivityResult.none));
  }
}
