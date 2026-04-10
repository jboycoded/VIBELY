import 'package:flutter/material.dart';

import 'controllers/live_connectivity.dart';
import 'controllers/live_mock_controller.dart';
import 'controllers/live_interactions.dart';

import 'model/live_screen_state.dart';

import 'widgets/live_layout/live_screen_body.dart';
import 'widgets/live_overlays/live_overlays.dart';
import 'widgets/live_overlays/live_overlay_builder.dart';

import '../../models/comment.dart'; // you used CommentModel

import 'utils/live_ui_helpers.dart';
import 'mixins/live_lifecycle_mixin.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen>
    with WidgetsBindingObserver, LiveLifecycleMixin {

  final LiveConnectivityController _connectivityController =
      LiveConnectivityController();

  final LiveMockController _mockController =
      LiveMockController();

  final LiveScreenStateModel state = LiveScreenStateModel();

  final GlobalKey giftKey = GlobalKey();
  final GlobalKey reactionsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    onSnack = (msg) => LiveUIHelpers.showSnack(context, msg);

    _connectivityController.init(
      onChanged: (connected) {
        setState(() {
          state.isLoading = connected;
        });

        if (connected) {
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() => state.isLoading = false);
            }
          });
        }
      },
      showSnack: (msg) => LiveUIHelpers.showSnack(context, msg),
    );

    if (state.isMockMode) {
      _initMock();
    }
  }

  Future<void> _initMock() async {
    final stream = await _mockController.initializeMock(
      onViewerUpdate: (count) {
        setState(() {
          state.liveStream =
              state.liveStream?.copyWith(viewers: count);
        });
      },
      onNewComment: (comments) {
        setState(() {
          state.comments = comments;
        });
      },
    );

    if (!mounted) return;

    setState(() {
      state.liveStream = stream;
      state.isLoading = false;
    });
  }

  void onLike() {
    setState(() {
      state.liveStream = LiveInteractions.onLike(
        isConnected: _connectivityController.isConnected,
        stream: state.liveStream!,
        reactionsKey: reactionsKey,
      );
    });
  }

  void sendGift(gift) {
    LiveInteractions.sendGift(
      isConnected: _connectivityController.isConnected,
      gift: gift,
      giftKey: giftKey,
      reactionsKey: reactionsKey,
      showSnack: (msg) => LiveUIHelpers.showSnack(context, msg),
    );
  }

  void sendMessage(String text) {
    setState(() {
      state.comments.add(
        CommentModel(
          username: "You",
          message: text,
          time: DateTime.now(),
        ),
      );
    });
  }

  void onShare() {
    LiveUIHelpers.showSnack(context, "Share clicked");
  }

  void openGiftPanel() {
    LiveUIHelpers.showSnack(context, "Open gift panel");
  }

  void exitStream() {
    LiveUIHelpers.showExitDialog(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _mockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final overlay = buildLiveOverlay(
      isConnected: _connectivityController.isConnected,
      isLoading: state.isLoading,
      streamEnded: state.streamEnded,
      noInternet: LiveOverlays.noInternet(),
      loading: LiveOverlays.loading(),
      ended: LiveOverlays.ended(exitStream, context),
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        exitStream();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: overlay ??
            LiveScreenBody(
              liveStream: state.liveStream!,
              comments: state.comments,
              onLike: onLike,
              onShare: onShare,
              onGiftPanel: openGiftPanel,
              onGiftSend: sendGift,
              onSendMessage: sendMessage,
              onExit: exitStream,
              reactionsKey: reactionsKey,
              giftKey: giftKey,
            ),
      ),
    );
  }
}
