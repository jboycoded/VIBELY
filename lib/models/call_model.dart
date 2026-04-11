enum CallType { voice, video }
enum CallStatus { missed, incoming, outgoing, ongoing }

class CallModel {
  final String id;
  final UserModel user;
  final DateTime time;
  final CallType type;
  final CallStatus status;

  CallModel({
    required this.id,
    required this.user,
    required this.time,
    required this.type,
    required this.status,
  });
}
