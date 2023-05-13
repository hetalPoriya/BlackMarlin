import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass {
  static SharedPreferenceClass? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<SharedPreferenceClass?> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    if (_storageUtil == null) {
      var secureStorage = SharedPreferenceClass._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  SharedPreferenceClass._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// put integer
  static Future<bool>? setInt(String key, int value) {
    if (_preferences == null) return null;
    return _preferences!.setInt(key, value);
  }

  /// get integer
  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getInt(key) ?? defValue;
  }

  /// put String
  static Future<bool>? setString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  /// Get String
  static String getString(String key, {String defValue = ""}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  static Future<bool> remove(String key) async {
    return _preferences!.remove(key);
  }

  static bool getBool(String key, bool defValue) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  static setBool(String key, bool value) async {
    _preferences!.setBool(key, value);
  }

  static clear() async {
    _preferences!.clear();
  }

  static Future<void> setUserData(String userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentUser', userData);
  }

  static Future<String> getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String myModel = pref.getString('currentUser') ?? "";
    print('MODEL $myModel');
    return myModel;
  }

  // static UserData? getUserDetails() {
  //   String body = getString(PreferencesKey.userModel);
  //   UserModel userModel = UserModel.fromJson(jsonDecode(body));
  //   return userModel.data;
  // }
}
