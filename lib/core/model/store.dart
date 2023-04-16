import 'package:prototype/core/model/store.dart';

class Store {
  int id;
  String name;
  String address;
  double distance;

  Store(
    this.id,
    this.name,
    this.address,
    this.distance,
  );

  bool equal(Store other) {
    return id == other.id;
  }

  static List<Store> getAllStores() {
    return [
      Store(1, "香港中環總店", "中環愛丁堡廣場5號", 45),
      Store(2, "香港灣仔分店", "灣仔告士打道7號", 830),
      Store(3, "香港尖沙咀旗艦店", "尖沙咀彌敦道35-79號", 1300),
      Store(4, "香港長沙灣分店", "九龍長沙灣道833號1樓121-123 號舖", 3500),
    ];
  }
}