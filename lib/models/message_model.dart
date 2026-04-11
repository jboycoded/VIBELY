enum MessageType { text, image, voice, gift }

enum MessageStatus { sending, sent, delivered, seen }

class MessageModel {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;

  final MessageType type;
  final MessageStatus status;

  /// optional extras
  final String? mediaUrl; // for image / voice
  final Duration? voiceDuration;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.type = MessageType.text,
    this.status = MessageStatus.sent,
    this.mediaUrl,
    this.voiceDuration,
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
      mediaUrl: mediaUrl,
      voiceDuration: voiceDuration,
    );
  }
}
