import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../streaming/host_live_screen.dart';

class GoLiveScreen extends StatefulWidget {
  const GoLiveScreen({super.key});

  @override
  State<GoLiveScreen> createState() => _GoLiveScreenState();
}

class _GoLiveScreenState extends State<GoLiveScreen> {
  final TextEditingController titleController = TextEditingController();

  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  /// Initialize the front camera
  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    // Use front camera for live preview
    _cameraController = CameraController(
      _cameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      ),
      ResolutionPreset.high,
    );
    await _cameraController!.initialize();
    if (mounted) setState(() {});
  }

  /// FUNCTION: When user clicks GO LIVE
  void startLive() {
    if (titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a stream title")),
      );
      return;
    }

    // Navigate to Live Screen (placeholder for now)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HostLiveScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // -----------------------------
          // CAMERA BACKGROUND
          // -----------------------------
          if (_cameraController != null &&
              _cameraController!.value.isInitialized)
            ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Transform.scale(
          scale: _cameraController!.value.aspectRatio /
              MediaQuery.of(context).size.aspectRatio,

          child: Center(
            child: AspectRatio(
              aspectRatio: _cameraController!.value.aspectRatio,
              child: CameraPreview(_cameraController!),
            ),
          ),
        ),
      )
          else
            Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          /*
          // -----------------------------
          // DARK OVERLAY
          // -----------------------------
          Container(
            color: Colors.black.withOpacity(0.5),
          ),*/

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // -----------------------------
                  // TOP BAR
                  // -----------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        "Go Live",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(width: 40), // spacing
                    ],
                  ),

                  const SizedBox(height: 30),

                  // -----------------------------
                  // COVER IMAGE (Optional)
                  // -----------------------------
                  GestureDetector(
                    onTap: () {
                      // later: open gallery
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B1534),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.white, size: 40),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // -----------------------------
                  // TITLE INPUT
                  // -----------------------------
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1534),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "What’s your stream about?",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),

                  const Spacer(),

                  // -----------------------------
                  // GO LIVE BUTTON
                  // -----------------------------
                  GestureDetector(
                    onTap: startLive,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF7B3BFF),
                            Color(0xFFFF4D8D),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "GO LIVE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
