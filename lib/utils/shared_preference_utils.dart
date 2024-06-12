import 'package:get_storage/get_storage.dart';

class PreferenceUtils {
  static GetStorage getStorage = GetStorage();

  static String userName = 'userName';
  static String userId = 'userId';
  static String register = 'register';
  static String isSignUp = "is_signUp";
  static String login = 'login';
  static String token = 'token';
  static String shoppingCart = 'shoppingCart';

  static Future setUserName(String value) async {
    await getStorage.write(userName, value);
  }

  static String getUserName() {
    return getStorage.read(userName) ?? '';
  }

  ///userID
  static Future setUserId(String value) async {
    await getStorage.write(userId, value);
  }

  static String getUserId() {
    return getStorage.read(userId) ?? '';
  }

  ///isSignUp
  static Future setIsSignUp(String value) async {
    await getStorage.write(isSignUp, value);
  }

  static String getIsSignUp() {
    return getStorage.read(isSignUp) ?? '';
  }

  ///Login
  static Future setLogin(int value) async {
    await getStorage.write(login, value);
  }

  static int getLogin() {
    return getStorage.read(login) ?? 0;
  }

  ///TOKEN
  static Future setToken(String? value) async {
    await getStorage.write(token, value);
  }

  static String getToken() {
    return getStorage.read(token) ?? '';
  }

  /// Register
  static Future setRegister(int value) async {
    await getStorage.write(register, value);
  }

  static int getRegister() {
    return getStorage.read(register) ?? 0;
  }

  /// Bottom Bar Cart Screen
  static Future setShoppingCart(int value) async {
    await getStorage.write(shoppingCart, value);
  }

  static int getShoppingCart() {
    return getStorage.read(shoppingCart) ?? 0;
  }

  ///logOut
  static Future clearPreference() async {
    getStorage.erase();
  }
}
