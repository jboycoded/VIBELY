import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class LiveConnectivityController {
  late Stream<List<ConnectivityResult>> connectivityStream;
  bool isConnected = true;

  void init({
    required Function(bool) onChanged,
    required Function(String) showSnack,
  }) {
    _checkInitialConnection(onChanged);

    connectivityStream = Connectivity().onConnectivityChanged;
    connectivityStream.listen((results) {
      _updateConnectionStatus(results, onChanged, showSnack);
    });
  }

  Future<void> _checkInitialConnection(Function(bool) onChanged) async {
    final results = await Connectivity().checkConnectivity();
    _updateConnectionStatus(results, onChanged, (_) {});
  }

  void _updateConnectionStatus(
    List<ConnectivityResult> results,
    Function(bool) onChanged,
    Function(String) showSnack,
  ) {
    final hasConnection =
        results.any((r) => r != ConnectivityResult.none);

    if (hasConnection != isConnected) {
      isConnected = hasConnection;
      onChanged(hasConnection);

      showSnack(
        hasConnection ? "✅ Back Online" : "❌ No Internet Connection",
      );
    }
  }
}
