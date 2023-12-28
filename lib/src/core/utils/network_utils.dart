import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkUtils {
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    var prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('videos_cache');

    if (connectivityResult == ConnectivityResult.none && value == null) {
      return false;
    } else {
      return true;
    }
  }
}
