extension IterableExtension<T> on Iterable<T> {
  T? firstOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
