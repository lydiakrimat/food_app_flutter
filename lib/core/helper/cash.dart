import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences cash;
  static Future<void> init() async {
    cash = await SharedPreferences.getInstance();
  }

  static Future<bool> putCash( {required String key,required dynamic value}) async {
    if (value is String) {
      return await cash.setString(key, value);
    } else if (value is int) {
      return await cash.setInt(key, value);
    } else if (value is double) {
      return await cash.setDouble(key, value);
    } else if (value is bool) {
      return await cash.setBool(key, value);
    }else {
      throw Exception('Unsupported value type');
    }
  }

  static dynamic getCash({required String key}) {
    return cash.get(key);
  }

  static Future<bool> removeCash({required String key}) async {
    return await cash.remove(key);
  }

  static Future<bool> clearCash() async {
    return await cash.clear();
  }
}