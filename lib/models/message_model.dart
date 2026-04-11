enum MessageType { text, image, voice, gift }

enum MessageStatus { sending, sent, delivered, seen }

class MessageModel {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;

  final MessageType type;
  final MessageStatus status;

  final String? mediaUrl;
  final Duration? voiceDuration;

  /// 🆕 reactions
  final Map<String, String> reactions; // userId -> emoji

  /// 🆕 seen by users
  final List<String> seenBy;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.type = MessageType.text,
    this.status = MessageStatus.sent,
    this.mediaUrl,
    this.voiceDuration,
    this.reactions = const {},
    this.seenBy = const [],
  });

  MessageModel copyWith({
    MessageStatus? status,
    Map<String, String>? reactions,
    List<String>? seenBy,
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
      reactions: reactions ?? this.reactions,
      seenBy: seenBy ?? this.seenBy,
    );
  }
}
