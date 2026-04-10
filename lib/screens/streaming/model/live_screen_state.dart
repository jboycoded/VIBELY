import '../../../models/live_stream.dart';
import '../../../models/comment.dart';

class LiveScreenStateModel {
  LiveStream? liveStream;
  List<CommentModel> comments = [];

  bool isMockMode = true;
  bool streamEnded = false;
  bool isLoading = true;
}
