import 'dart:io';
import 'package:local_database/CategoryData.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabseProvider {
  static Database? _database;
  static final DatabseProvider dbProvider = DatabseProvider._();

  DatabseProvider._();

  Future<Database> get databse async{
    if (_database != null) return _database!;

    _database = await initDb();

    return _database!;
  }
  initDb() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path,"category_manager.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE CategoryData('
              'id INTEGER PRIMARY KEY,'
              'Name TEXT,'
              ')');
        });
  }

  createProduct(CategoryData categoryData) async{
    await deleteAllCategoryData();

    final db =await databse;
    final res = await db.insert('CategoryData', categoryData.toJson());

    return res;
  }
  Future<int> deleteAllCategoryData() async{
    final db =await databse;
    final res = await db.rawDelete('DELETE FROM CategoryData');

    return res;
  }
  Future<List<CategoryData>> getAllProduct() async {
    final db =await databse;
    final res = await db.rawQuery("SELECT * FROM CategoryData");

    List<CategoryData> list =
    res.isNotEmpty ? res.map((c) => CategoryData.fromJson(c)).toList() : [];

    return list;
  }


}


