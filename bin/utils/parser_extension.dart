extension ParserExtension on String {
  toType(Type type) {
    switch (type) {
      case const (String):
        return toString();
      case const (int):
        return int.parse(toString());
      default:
        return toString();
    }
  }
}
