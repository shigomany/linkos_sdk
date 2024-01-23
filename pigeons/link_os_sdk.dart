import 'package:pigeon/pigeon.dart';

enum Code { one, two }

class MessageData {
  MessageData({required this.code, required this.data});
  String? name;
  String? description;
  Code code;
  Map<String?, String?> data;
}

@HostApi()
abstract class LinkOsSdk {
  String getHostLanguage();

  @ObjCSelector('addNumber:toNumber:')
  int add(int a, int b);

  @async
  bool sendMessage(MessageData message);
}
