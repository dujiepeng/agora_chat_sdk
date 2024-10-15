import '../internal/inner_headers.dart';

/// ~english
/// The message thread class.
/// ~end
///
/// ~chinese
/// 子区详情类。
/// ~end
class ChatThread {
  /// ~english
  /// The message thread ID.
  /// ~end
  ///
  /// ~chinese
  /// 子区 ID。
  /// ~end
  final String threadId;

  /// ~english
  /// The name of the message thread.
  /// ~end
  ///
  /// ~chinese
  /// 子区名称。
  /// ~end
  final String? threadName;

  /// ~english
  /// The creator of the message thread.
  /// ~end
  ///
  /// ~chinese
  /// 子区创建者的用户 ID。
  /// ~end
  final String? owner;

  /// ~english
  /// The ID of the parent message of the message thread.
  /// ~end
  ///
  /// ~chinese
  /// 子区父消息 ID。
  /// ~end
  final String messageId;

  /// ~english
  /// The group ID where the message thread belongs.
  /// ~end
  ///
  /// ~chinese
  /// 子区所属的群组 ID。
  /// ~end
  final String parentId;

  /// ~english
  /// The count of members in the message thread.
  /// ~end
  ///
  /// ~chinese
  /// 子区成员数量。
  /// ~end
  final int membersCount;

  /// ~english
  /// The count of messages in the message thread.
  /// ~end
  ///
  /// ~chinese
  /// 子区消息数量。
  /// ~end
  final int messageCount;

  /// ~english
  /// The Unix timestamp when the message thread is created. The unit is millisecond.
  /// ~end
  ///
  /// ~chinese
  /// 子区创建的 Unix 时间戳。单位为毫秒。
  /// ~end
  final int createAt;

  /// ~english
  /// The last reply in the message thread. If it is empty, the last message is withdrawn.
  /// ~end
  ///
  /// ~chinese
  /// 子区最新一条消息。如果为空，表明最新一条消息被撤回。
  /// ~end
  final ChatMessage? lastMessage;

  ChatThread._private({
    required this.threadId,
    this.threadName,
    required this.owner,
    required this.messageId,
    required this.parentId,
    required this.membersCount,
    required this.messageCount,
    required this.createAt,
    this.lastMessage,
  });

  factory ChatThread.fromJson(Map map) {
    String threadId = map["threadId"];
    String owner = map["owner"];
    String messageId = map["msgId"];
    String parentId = map["parentId"];
    int memberCount = map["memberCount"] as int;
    int messageCount = map["messageCount"] as int;
    int createAt = map["createAt"] as int;
    ChatMessage? msg;
    if (map.containsKey("lastMessage")) {
      msg = ChatMessage.fromJson(map["lastMessage"]);
    }
    String? threadName;
    if (map.containsKey("threadName")) {
      threadName = map["threadName"];
    }

    return ChatThread._private(
      threadId: threadId,
      owner: owner,
      messageId: messageId,
      parentId: parentId,
      membersCount: memberCount,
      messageCount: messageCount,
      createAt: createAt,
      lastMessage: msg,
      threadName: threadName,
    );
  }

  ChatThread copyWith({
    String? threadId,
    String? threadName,
    String? owner,
    String? messageId,
    String? parentId,
    int? membersCount,
    int? messageCount,
    int? createAt,
    ChatMessage? lastMessage,
  }) {
    return ChatThread._private(
      threadId: threadId ?? this.threadId,
      threadName: threadName ?? this.threadName,
      owner: owner ?? this.owner,
      messageId: messageId ?? this.messageId,
      parentId: parentId ?? this.parentId,
      membersCount: membersCount ?? this.membersCount,
      messageCount: messageCount ?? this.messageCount,
      createAt: createAt ?? this.createAt,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }
}

/// ~english
/// The message thread event class.
/// ~end
///
/// ~chinese
/// 子区通知类。
/// ~end
class ChatThreadEvent {
  /// ~english
  /// Received the operation type of the sub-area from others
  /// ~end
  ///
  /// ~chinese
  /// 子区事件类型。
  /// ~end
  final ChatThreadOperation type;

  /// ~english
  /// User id of the operation sub-area
  /// ~end
  ///
  /// ~chinese
  /// 子区操作者。
  /// ~end
  final String from;

  /// ~english
  /// sub-area
  /// ~end
  ///
  /// ~chinese
  /// 子区实例。
  /// ~end
  final ChatThread? chatThread;

  ChatThreadEvent._private({
    required this.type,
    required this.from,
    this.chatThread,
  });

  factory ChatThreadEvent.fromJson(Map map) {
    String from = map["from"];
    int iType = map["type"];
    ChatThreadOperation type = ChatThreadOperation.UnKnown;
    switch (iType) {
      case 0:
        type = ChatThreadOperation.UnKnown;
        break;
      case 1:
        type = ChatThreadOperation.Create;
        break;
      case 2:
        type = ChatThreadOperation.Update;
        break;
      case 3:
        type = ChatThreadOperation.Delete;
        break;
      case 4:
        type = ChatThreadOperation.Update_Msg;
        break;
    }

    ChatThread? chatThread = map.getValue<ChatThread>(
      "thread",
      callback: (map) {
        if (map == null) {
          return null;
        }
        return ChatThread.fromJson(map);
      },
    );

    return ChatThreadEvent._private(
      type: type,
      from: from,
      chatThread: chatThread,
    );
  }
}
