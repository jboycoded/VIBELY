class ConversationModel {
  final String id;
  final UserModel user;
  final MessageModel lastMessage;
  final int unreadCount;

  ConversationModel({
    required this.id,
    required this.user,
    required this.lastMessage,
    this.unreadCount = 0,
  });

  ConversationModel copyWith({
    MessageModel? lastMessage,
    int? unreadCount,
  }) {
    return ConversationModel(
      id: id,
      user: user,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}
