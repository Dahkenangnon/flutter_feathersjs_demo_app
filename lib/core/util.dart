import 'dart:async';
import 'package:flutter_feathersjs_demo_app/core/Constants.dart';
import 'package:flutter_feathersjs_demo_app/core/user.dart';
import 'package:flutter_feathersjs_demo_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Utils {
// Save the current user in the cache
  Future<bool> setLoggedUser(Map<String, dynamic> user) async {
    return sl<SharedPreferences>().setString(
      Constants.LOGGED_USER,
      json.encode(user),
    );
  }

  // Get the current logged user
  User getLoggedUser() {
    final jsonString = sl<SharedPreferences>().getString(Constants.LOGGED_USER);
    if (jsonString != null) {
      return User.fromJson(json.decode(jsonString));
    } else {
      //throw CacheException();
      return null;
    }
  }

  // Clear all saved information in the cache
  Future<bool> logout() async {
    return sl<SharedPreferences>().clear();
  }

// Helper to encode datetime to json as native conversion throw:
// Converting object to an encodable object failed: Instance of 'DateTime'
  dateTimeToJson(DateTime date) {
    var jc = JsonCodec();
    return jc.encode(date, toEncodable: myEncode);
  }

  jsonToDateTime(String date) {
    var jc = JsonCodec();
    return jc.decode(date);
  }

  dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }
}
