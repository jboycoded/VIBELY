class LiveStream {
  final String id;
  final String hostName;
  final String title;
  final int viewers;
  final int likes;
  final bool isLive;

  LiveStream({
    required this.id,
    required this.hostName,
    required this.title,
    required this.viewers,
    required this.likes,
    required this.isLive,
  });

  LiveStream copyWith({
    int? viewers,
    int? likes,
  }) {
    return LiveStream(
      id: id,
      hostName: hostName,
      title: title,
      viewers: viewers ?? this.viewers,
      likes: likes ?? this.likes,
      isLive: isLive,
    );
  }
}
