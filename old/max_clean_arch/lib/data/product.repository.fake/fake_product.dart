class FakeProduct {
  final Map<String, dynamic> data;

  const FakeProduct(this.data);

  dynamic operator [](String key) {
    return data[key];
  }
}
