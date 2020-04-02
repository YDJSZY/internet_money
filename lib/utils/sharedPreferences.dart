import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences globalPrefs;

initSharedPreferences() async {
  globalPrefs = await SharedPreferences.getInstance();
  return globalPrefs;
}