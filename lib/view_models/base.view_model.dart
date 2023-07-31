import 'package:keepo/data/datasource/datasource_contract.dart';
import 'package:keepo/models/chat/message_model.dart';

abstract class BaseViewModel {
  late IDataSource _dataSource;

  BaseViewModel(this._dataSource);

  Future<void> addMessage(Message message) async {
    // if (!_isExistingChat(message.messageId)) await _createNewChat(message.messageId);
    await _dataSource.addMessage(message);
  }

  // Future<bool> _isExistingChat(String id) async {
  //   return await _dataSource
  // }
}
