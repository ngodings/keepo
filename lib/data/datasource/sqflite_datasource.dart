import 'package:sqflite/sqflite.dart';
import 'package:keepo/data/datasource/datasource_contract.dart';
import 'package:keepo/models/chat/message_model.dart';

class SqfLiteDataSource extends IDataSource {
  final Database _db;

  SqfLiteDataSource(this._db);

  @override
  Future<void> addMessage(Message message) async {
    await _db.insert('messages', message.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> deleteMessage(String messageId) {
    // TODO: implement deleteMessage
    throw UnimplementedError();
  }

  @override
  Future<void> updateMessage(Message message) {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }
}
