class Optional<T> {
  Optional(T? value) {
    _value = value;
  }

  T? _value;

  T? get() {
    return _value;
  }

  T getOrElse(T defaultValue) {
    return _value ?? defaultValue;
  }

  bool isPresent() {
    return _value != null;
  }
}

abstract class IJSONable {
  Map toJson();
}

class JSONAbleList<T> implements IJSONable {
  const JSONAbleList({required this.list});

  final List<T> list;

  @override
  Map toJson() => {list: list};
}

bool sameTypes<S, V>() {
  void func<X extends S>() {}
  return func is void Function<X extends V>();
}
