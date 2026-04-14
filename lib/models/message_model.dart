enum MessageType { text, image, voice, gift }

enum MessageStatus { sending, delivered, seen }

class MessageModel {
  final String id;
  final String senderId;
  final String text;
  final MessageType type;
  final String? mediaUrl;
  final Duration? voiceDuration;
  final DateTime timestamp;

  final MessageStatus status;
  final List<String> seenBy;

  /// 🔁 REPLY
  final String? replyToMessageId;
  final String? replyText;
  final String? replySenderId;

  /// ❤️ REACTIONS
  final Map<String, String> reactions;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.text,
    this.type = MessageType.text,
    this.mediaUrl,
    this.voiceDuration,
    required this.timestamp,
    this.status = MessageStatus.sending,
    this.seenBy = const [],
    this.replyToMessageId,
    this.replyText,
    this.replySenderId,
    this.reactions = const {},
  });

  MessageModel copyWith({
    MessageStatus? status,
    Map<String, String>? reactions,
  }) {
    return MessageModel(
      id: id,
      senderId: senderId,
      text: text,
      type: type,
      mediaUrl: mediaUrl,
      voiceDuration: voiceDuration,
      timestamp: timestamp,
      status: status ?? this.status,
      seenBy: seenBy,
      replyToMessageId: replyToMessageId,
      replyText: replyText,
      replySenderId: replySenderId,
      reactions: reactions ?? this.reactions,
    );
  }
}
