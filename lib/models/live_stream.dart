import 'user_model.dart';

class LiveStream {
  final String id;
  final String hostName;
  final String title;
  final UserModel? user;
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
    this.user = null,
  });

  LiveStream copyWith({
    int? viewers,
    int? l likes,
   UserModel? user
  }) {
    return LiveStream(
      id: id,
      hostName: hostName,
      title: title,
      viewers: viewers ?? this.viewers,
      likes: likes ?? this.likes,
      user: user ?? this.user,
      isLive: isLive,
    );
  }
}
