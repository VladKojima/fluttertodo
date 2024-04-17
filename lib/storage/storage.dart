import 'package:flutter_todolist/utils.dart';

abstract class JSONIKVStorage{
  Future<void> init();

  Future<Optional<T>> get<T extends IJSONable>(String key);

  Future<void> set<T extends IJSONable>(String key, T value);
}
