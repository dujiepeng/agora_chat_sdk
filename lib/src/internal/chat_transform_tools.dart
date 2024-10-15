import 'inner_headers.dart';

ChatMultiDevicesEvent? convertIntToChatMultiDevicesEvent(int? i) {
  switch (i) {
    case 2:
      return ChatMultiDevicesEvent.CONTACT_REMOVE;
    case 3:
      return ChatMultiDevicesEvent.CONTACT_ACCEPT;
    case 4:
      return ChatMultiDevicesEvent.CONTACT_DECLINE;
    case 5:
      return ChatMultiDevicesEvent.CONTACT_BAN;
    case 6:
      return ChatMultiDevicesEvent.CONTACT_ALLOW;
    case 10:
      return ChatMultiDevicesEvent.GROUP_CREATE;
    case 11:
      return ChatMultiDevicesEvent.GROUP_DESTROY;
    case 12:
      return ChatMultiDevicesEvent.GROUP_JOIN;
    case 13:
      return ChatMultiDevicesEvent.GROUP_LEAVE;
    case 14:
      return ChatMultiDevicesEvent.GROUP_APPLY;
    case 15:
      return ChatMultiDevicesEvent.GROUP_APPLY_ACCEPT;
    case 16:
      return ChatMultiDevicesEvent.GROUP_APPLY_DECLINE;
    case 17:
      return ChatMultiDevicesEvent.GROUP_INVITE;
    case 18:
      return ChatMultiDevicesEvent.GROUP_INVITE_ACCEPT;
    case 19:
      return ChatMultiDevicesEvent.GROUP_INVITE_DECLINE;
    case 20:
      return ChatMultiDevicesEvent.GROUP_KICK;
    case 21:
      return ChatMultiDevicesEvent.GROUP_BAN;
    case 22:
      return ChatMultiDevicesEvent.GROUP_ALLOW;
    case 23:
      return ChatMultiDevicesEvent.GROUP_BLOCK;
    case 24:
      return ChatMultiDevicesEvent.GROUP_UNBLOCK;
    case 25:
      return ChatMultiDevicesEvent.GROUP_ASSIGN_OWNER;
    case 26:
      return ChatMultiDevicesEvent.GROUP_ADD_ADMIN;
    case 27:
      return ChatMultiDevicesEvent.GROUP_REMOVE_ADMIN;
    case 28:
      return ChatMultiDevicesEvent.GROUP_ADD_MUTE;
    case 29:
      return ChatMultiDevicesEvent.GROUP_REMOVE_MUTE;
    case 40:
      return ChatMultiDevicesEvent.CHAT_THREAD_CREATE;
    case 41:
      return ChatMultiDevicesEvent.CHAT_THREAD_DESTROY;
    case 42:
      return ChatMultiDevicesEvent.CHAT_THREAD_JOIN;
    case 43:
      return ChatMultiDevicesEvent.CHAT_THREAD_LEAVE;
    case 44:
      return ChatMultiDevicesEvent.CHAT_THREAD_KICK;
    case 45:
      return ChatMultiDevicesEvent.CHAT_THREAD_UPDATE;
    case 52:
      return ChatMultiDevicesEvent.GROUP_MEMBER_ATTRIBUTES_CHANGED;
    case 60:
      return ChatMultiDevicesEvent.CONVERSATION_PINNED;
    case 61:
      return ChatMultiDevicesEvent.CONVERSATION_UNPINNED;
    case 62:
      return ChatMultiDevicesEvent.CONVERSATION_DELETE;
    case 63:
      return ChatMultiDevicesEvent.CONVERSATION_UPDATE_MARK;
  }
  return null;
}

String messageTypeToTypeStr(MessageType type) {
  switch (type) {
    case MessageType.TXT:
      return 'txt';
    case MessageType.LOCATION:
      return 'loc';
    case MessageType.CMD:
      return 'cmd';
    case MessageType.CUSTOM:
      return 'custom';
    case MessageType.FILE:
      return 'file';
    case MessageType.IMAGE:
      return 'img';
    case MessageType.VIDEO:
      return 'video';
    case MessageType.VOICE:
      return 'voice';
    case MessageType.COMBINE:
      return 'combine';
  }
}

int chatTypeToInt(ChatType type) {
  if (type == ChatType.ChatRoom) {
    return 2;
  } else if (type == ChatType.GroupChat) {
    return 1;
  } else {
    return 0;
  }
}

ChatType chatTypeFromInt(int? type) {
  if (type == 2) {
    return ChatType.ChatRoom;
  } else if (type == 1) {
    return ChatType.GroupChat;
  } else {
    return ChatType.Chat;
  }
}

int messageStatusToInt(MessageStatus status) {
  if (status == MessageStatus.FAIL) {
    return 3;
  } else if (status == MessageStatus.SUCCESS) {
    return 2;
  } else if (status == MessageStatus.PROGRESS) {
    return 1;
  } else {
    return 0;
  }
}

MessageStatus messageStatusFromInt(int? status) {
  if (status == 3) {
    return MessageStatus.FAIL;
  } else if (status == 2) {
    return MessageStatus.SUCCESS;
  } else if (status == 1) {
    return MessageStatus.PROGRESS;
  } else {
    return MessageStatus.CREATE;
  }
}

int downloadStatusToInt(DownloadStatus status) {
  if (status == DownloadStatus.DOWNLOADING) {
    return 0;
  } else if (status == DownloadStatus.SUCCESS) {
    return 1;
  } else if (status == DownloadStatus.FAILED) {
    return 2;
  } else {
    return 3;
  }
}

ChatGroupPermissionType permissionTypeFromInt(int? type) {
  ChatGroupPermissionType ret = ChatGroupPermissionType.Member;
  switch (type) {
    case -1:
      {
        ret = ChatGroupPermissionType.None;
      }
      break;
    case 0:
      {
        ret = ChatGroupPermissionType.Member;
      }
      break;
    case 1:
      {
        ret = ChatGroupPermissionType.Admin;
      }
      break;
    case 2:
      {
        ret = ChatGroupPermissionType.Owner;
      }
      break;
  }
  return ret;
}

int permissionTypeToInt(ChatGroupPermissionType? type) {
  int ret = 0;
  if (type == null) return ret;
  switch (type) {
    case ChatGroupPermissionType.None:
      {
        ret = -1;
      }
      break;
    case ChatGroupPermissionType.Member:
      {
        ret = 0;
      }
      break;
    case ChatGroupPermissionType.Admin:
      {
        ret = 1;
      }
      break;
    case ChatGroupPermissionType.Owner:
      {
        ret = 2;
      }
      break;
  }
  return ret;
}

ChatGroupStyle groupStyleTypeFromInt(int? type) {
  ChatGroupStyle ret = ChatGroupStyle.PrivateOnlyOwnerInvite;
  switch (type) {
    case 0:
      {
        ret = ChatGroupStyle.PrivateOnlyOwnerInvite;
      }
      break;
    case 1:
      {
        ret = ChatGroupStyle.PrivateMemberCanInvite;
      }
      break;
    case 2:
      {
        ret = ChatGroupStyle.PublicJoinNeedApproval;
      }
      break;
    case 3:
      {
        ret = ChatGroupStyle.PublicOpenJoin;
      }
      break;
  }
  return ret;
}

int groupStyleTypeToInt(ChatGroupStyle? type) {
  int ret = 0;
  if (type == null) return ret;
  switch (type) {
    case ChatGroupStyle.PrivateOnlyOwnerInvite:
      {
        ret = 0;
      }
      break;
    case ChatGroupStyle.PrivateMemberCanInvite:
      {
        ret = 1;
      }
      break;
    case ChatGroupStyle.PublicJoinNeedApproval:
      {
        ret = 2;
      }
      break;
    case ChatGroupStyle.PublicOpenJoin:
      {
        ret = 3;
      }
      break;
  }
  return ret;
}

ChatRoomPermissionType chatRoomPermissionTypeFromInt(int? type) {
  ChatRoomPermissionType ret = ChatRoomPermissionType.Member;
  switch (type) {
    case -1:
      return ChatRoomPermissionType.None;
    case 0:
      return ChatRoomPermissionType.Member;
    case 1:
      return ChatRoomPermissionType.Admin;
    case 2:
      return ChatRoomPermissionType.Owner;
  }
  return ret;
}

int chatRoomPermissionTypeToInt(ChatRoomPermissionType type) {
  int ret = 0;
  switch (type) {
    case ChatRoomPermissionType.None:
      ret = -1;
      break;
    case ChatRoomPermissionType.Member:
      ret = 0;
      break;
    case ChatRoomPermissionType.Admin:
      ret = 1;
      break;
    case ChatRoomPermissionType.Owner:
      ret = 2;
      break;
  }
  return ret;
}

int conversationTypeToInt(ChatConversationType? type) {
  int ret = 0;
  if (type == null) return ret;
  switch (type) {
    case ChatConversationType.Chat:
      ret = 0;
      break;
    case ChatConversationType.GroupChat:
      ret = 1;
      break;
    case ChatConversationType.ChatRoom:
      ret = 2;
      break;
  }
  return ret;
}

ChatConversationType conversationTypeFromInt(int? type) {
  ChatConversationType ret = ChatConversationType.Chat;
  switch (type) {
    case 0:
      ret = ChatConversationType.Chat;
      break;
    case 1:
      ret = ChatConversationType.GroupChat;
      break;
    case 2:
      ret = ChatConversationType.ChatRoom;
      break;
  }
  return ret;
}

int? chatSilentModeParamTypeToInt(ChatSilentModeParamType? type) {
  int? ret;
  if (type == null) {
    return ret;
  }
  switch (type) {
    case ChatSilentModeParamType.REMIND_TYPE:
      ret = 0;
      break;
    case ChatSilentModeParamType.SILENT_MODE_DURATION:
      ret = 1;
      break;
    case ChatSilentModeParamType.SILENT_MODE_INTERVAL:
      ret = 2;
      break;
  }
  return ret;
}

int? chatPushRemindTypeToInt(ChatPushRemindType? type) {
  int? ret;
  if (type == null) {
    return ret;
  }
  switch (type) {
    case ChatPushRemindType.ALL:
      ret = 0;
      break;
    case ChatPushRemindType.MENTION_ONLY:
      ret = 1;
      break;
    case ChatPushRemindType.NONE:
      ret = 2;
      break;
  }
  return ret;
}

ChatPushRemindType chatPushRemindTypeFromInt(int iRemindType) {
  ChatPushRemindType type = ChatPushRemindType.ALL;
  switch (iRemindType) {
    case 0:
      type = ChatPushRemindType.ALL;
      break;
    case 1:
      type = ChatPushRemindType.MENTION_ONLY;
      break;
    case 2:
      type = ChatPushRemindType.NONE;
      break;
  }
  return type;
}
