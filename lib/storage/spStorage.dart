import 'dart:convert';

import 'package:flutter_todolist/storage/storage.dart';
import 'package:flutter_todolist/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPStorage implements JSONIKVStorage {
  SharedPreferences? _prefs;

  final _jE = const JsonEncoder();
  final _jD = const JsonDecoder();

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<Optional<T>> get<T extends IJSONable>(String key) async {
    String? val = _prefs!.getString(key);

    if (val == null) {
      return Optional<T>(null);
    }

    return Optional<T>(_jD.convert(val) as T);
  }

  @override
  Future<void> set<T extends IJSONable>(String key, T value) {
    return _prefs!.setString(key, _jE.convert(value.toJson()));
  }
}
