// import 'package:keepo/data/datasource/datasource_contract.dart';
// import 'package:keepo/view_models/base.view_model.dart';
//
// class MessageViewModel extends BaseViewModel {
//   late IDataSource _dataSource;
//
//   MessageViewModel(this._dataSource) : super(_dataSource);
//
//   Future<List<LocalMessage>> getMessages(String chatId) async {
//     final messages = await _datasource.findMessages(chatId);
//     if (messages.isNotEmpty) _chatId = chatId;
//     return messages;
//   }
//
//   Future<void> sentMessage(Message message) async {
//     LocalMessage localMessage =
//     LocalMessage(chatId, message, ReceiptStatus.sent);
//     if (_chatId.isNotEmpty) return await _datasource.addMessage(localMessage);
//     _chatId = localMessage.chatId;
//     await addMessage(localMessage);
//   }
// }