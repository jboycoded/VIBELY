class ChatModel {
  final String name;
  final String message;
  final String time;
  final String image;
  final bool online;

  int unreadCount; // dynamic unread count

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    this.online = false,
    this.unreadCount = 0,
  });
}
