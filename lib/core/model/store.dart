import 'package:latlong2/latlong.dart';
import 'package:prototype/core/model/store.dart';

class Store {
  int id;
  String name;
  String address;
  double distance;
  LatLng latlng;
  String phone;

  Store(
    this.id,
    this.name,
    this.address,
    this.distance,
    this.latlng,
    this.phone,
  );

  bool equal(Store other) {
    return id == other.id;
  }

  static List<Store> getAllStores() {
    return [
      Store(1, "香港中環總店", "中環愛丁堡廣場 5號", 
        45, LatLng(22.28236325202399, 114.1616593517559),
        "3429 0239"),
      Store(2, "香港灣仔分店", "灣仔告士打道 7號", 
        830, LatLng(22.279786674730488, 114.17305446710051),
        "5203 1211"),
      Store(3, "香港尖沙咀旗艦店", "尖沙咀彌敦道 35-79號", 
        1300, LatLng(22.296277706377477, 114.17212079593702),
        "8932 1111"),
      Store(4, "香港長沙灣分店", "九龍長沙灣道 833號 1樓 121-123號舖", 
        3500, LatLng(22.34005059754184, 114.15266872477454),
        "3466 1342"),
    ];
  }
}