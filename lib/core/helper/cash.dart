import 'dart:convert';

import 'package:food_app/core/const/cash_keys.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';
import 'package:food_app/core/models/user_model.dart';
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
    }else if (value is List<String>) {
      return await cash.setStringList(key, value);
    }else
     // Pour les objets UserModel
     if (value is UserModel) {
      final jsonString = jsonEncode(value.toFirestore());
      return await cash.setString(key, jsonString);
    }
    else {
      throw Exception('Unsupported value type');
    }
  }

  static dynamic getCash({required String key}) {
    return cash.get(key);
  }

  static Future<void> saveUser(UserModel user) async {
    await putCash(key: CashKeys.userData, value: user);
    // await putCash(key: CashKeys.userId, value: user.uid);
    // await putCash(key: CashKeys.userEmail, value: user.email);
    await putCash(key: CashKeys.userRole, value: user.role.name);
    await putCash(key: CashKeys.isLogin, value: true);
  }

  static UserModel? getUser() {
    final jsonString = cash.getString(CashKeys.userData);
    if (jsonString == null) return null;
    
    try {
      final Map<String, dynamic> userData = jsonDecode(jsonString);
      return UserModel.fromFirestore(userData);
    } catch (e) {
      print('Error parsing user from cache: $e');
      return null;
    }
  }

  static UserRole? getUserRole() {
    final roleString = cash.getString(CashKeys.userRole);
    if (roleString == 'ADMIN') return UserRole.ADMIN;
    if (roleString == 'USER') return UserRole.USER;
    return null;
  }

  static bool isAdmin() {
    return getUserRole() == UserRole.ADMIN;
  }

  static bool isLoggedIn() {
    return cash.getBool(CashKeys.isLogin) ?? false;
  }

  static Future<void> logout() async {
    await removeCash(key: CashKeys.isLogin);
    await removeCash(key: CashKeys.userRole);
    // await removeCash(key: CashKeys.userEmail);
    // await removeCash(key: CashKeys.userId);
    await removeCash(key: CashKeys.userData);
  }
  
  static Future<bool> removeCash({required String key}) async {
    return await cash.remove(key);
  }

  static Future<bool> clearCash() async {
    return await cash.clear();
  }
}