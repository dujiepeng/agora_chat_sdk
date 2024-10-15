import 'package:agora_chat_sdk/src/internal/inner_headers.dart';

class ChatContact {
  final String userId;
  final String remark;

  ChatContact._private(Map map)
      : userId = map["userId"],
        remark = map["remark"];

  Map toJson() {
    Map data = Map();
    data.putIfNotNull("userId", userId);
    data.putIfNotNull("remark", remark);

    return data;
  }

  factory ChatContact.fromJson(Map map) {
    return ChatContact._private(map);
  }
}
