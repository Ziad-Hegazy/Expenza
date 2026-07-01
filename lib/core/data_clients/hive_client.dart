import 'package:hive/hive.dart';

class HiveClient {

  Future<dynamic> get(String boxName, String key) async {
    Box box = await Hive.openBox(boxName);
    dynamic item = box.get(key);
    box.close();
    return item;
  }

  Future<void> add(List<dynamic> items, String boxName) async {
    Box box = await Hive.openBox(boxName);
    box.addAll(items);
    box.close();
  }

  Future<void> put (Map<dynamic,dynamic> items, String boxName) async {
    Box box = await Hive.openBox(boxName);
    box.putAll(items);
    box.close();
  }

  Future<void> delete (dynamic item, String boxName, String key) async {
    Box box = await Hive.openBox(boxName);
    box.delete(key);
    box.close();
  }

  Future<void> clear (dynamic item, String boxName, String key) async {
    Box box = await Hive.openBox(boxName);
    box.clear();
    box.close();
  }

}