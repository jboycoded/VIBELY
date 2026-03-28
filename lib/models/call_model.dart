enum CallType { voice, video }
enum CallStatus { missed, incoming, outgoing }

class CallModel {
  final String name;
  final String image;
  final String time;
  final CallType type;
  final CallStatus status;

  CallModel({
    required this.name,
    required this.image,
    required this.time,
    required this.type,
    required this.status,
  });
}
