import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movies/core/connection/network_info.dart';

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnection internetConnection;
  NetworkInfoImpl(this.internetConnection);
  @override
  Future<bool> isConnected() async {
    return await internetConnection.hasInternetAccess;
  }
}
