import 'package:azlistview/azlistview.dart';

class AZItem extends ISuspensionBean {
  final String displayName;
  final String tag;
  final String? username;

  AZItem({required this.displayName, required this.tag, this.username});

  @override
  String getSuspensionTag() => tag;
}