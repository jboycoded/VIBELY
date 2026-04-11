enum MessageType { text, gift, image }
enum MessageStatus { sending, sent, delivered, seen }

class MessageModel {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final MessageType type;
  final MessageStatus status;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.type = MessageType.text,
    this.status = MessageStatus.sent,
  });

  MessageModel copyWith({
    MessageStatus? status,
  }) {
    return MessageModel(
      id: id,
      senderId: senderId,
      text: text,
      timestamp: timestamp,
      type: type,
      status: status ?? this.status,
    );
  }
}
