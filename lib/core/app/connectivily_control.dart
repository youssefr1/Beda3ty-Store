import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityControler {
  ConnectivityControler._();

  static final ConnectivityControler instance = ConnectivityControler._();

  ValueNotifier<bool> isConected = ValueNotifier(true);

  Future<void> init() async {
    // check once at start
    final results = await Connectivity().checkConnectivity();
    updateConnectionStatus(results);

    // listen to connectivity changes
    Connectivity().onConnectivityChanged.listen(updateConnectionStatus);
  }

  void updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      isConected.value = false;

    } else if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet)) {
      isConected.value = true;
    } else {
      isConected.value = false;
    }
  }
}
