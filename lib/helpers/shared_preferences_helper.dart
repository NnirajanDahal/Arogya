import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._internal();
  late SharedPreferences _prefs;

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool('isLoggedIn', value);
  }

  Future<bool> isLoggedIn() async {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> saveLoggedInTime() async {
    await _prefs.setString('loggedInTime', DateTime.now().toIso8601String());
  }

  Future<String?> getLoggedInTime() async {
    return _prefs.getString('loggedInTime');
  }
}
