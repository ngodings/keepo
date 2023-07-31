import 'package:keepo/models/chat/message_model.dart';

abstract class IDataSource {
  Future<void> addMessage(Message message);
  Future<void> updateMessage(Message message);
  Future<void> deleteMessage(String messageId);
}
