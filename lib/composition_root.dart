import 'package:sqflite/sqflite.dart';
import 'package:keepo/data/datasource/datasource_contract.dart';
import 'package:keepo/data/datasource/sqflite_datasource.dart';
import 'package:keepo/data/factories/db_factory.dart';

class CompositionRoot {
  static Database? _db;
  static IDataSource? _datasource;

  static configure() async {
    _db = await LocalDatabaseFactory().createDatabase();
    _datasource = SqfLiteDataSource(_db!);
  }
}
