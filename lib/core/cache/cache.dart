class CacheData {
  static String? name;
  static String? productID;

  void setName(String value) {
    CacheData.name = value;
  }

  String? getName() {
    return name;
  }

  void setProductID(String value) {
    CacheData.productID = value;
  }

  String? getProductID() {
    return productID;
  }
}
