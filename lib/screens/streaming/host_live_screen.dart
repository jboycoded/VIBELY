import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HostLiveScreen extends StatefulWidget {
  const HostLiveScreen({super.key});

  @override
  State<HostLiveScreen> createState() => _HostLiveScreenState();
}

class _HostLiveScreenState extends State<HostLiveScreen> {
  
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  /// 0 for front, 1 for back
  int selectedCameraIndex = 0;

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
  
  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }
  
  /// function tto flip the camera
  Future<void> switchCamera() async {
    if (_cameras == null || _cameras!.isEmpty) return;

  selectedCameraIndex =
      selectedCameraIndex == 0 ? 1 : 0;
      
  await _cameraController?.dispose();

  _cameraController = CameraController(
    _cameras![selectedCameraIndex],
    ResolutionPreset.high,
  );

  await _cameraController!.initialize();
  setState(() {});
    
  }
  


  List<String> messages = [
    "Alex: 🔥🔥🔥",
    "Jane: You look good!",
    "Mike: Send shoutout!",
  ];

  int coins = 2340;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🎥 CAMERA / VIDEO
          // -----------------------------
          // CAMERA BACKGROUND
          // -----------------------------
          if (_cameraController != null &&
              _cameraController!.value.isInitialized)
            SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover, // 👈 KEY LINE
          child: SizedBox(
            width: _cameraController!.value.previewSize!.height,
            height: _cameraController!.value.previewSize!.width,
            child: CameraPreview(_cameraController!),
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
          
          /// BACKGROUND (REPLACE LATER)
          /*Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/streamer1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DARK OVERLAY
          Container(color: Colors.black.withOpacity(0.3)),*/

          SafeArea(
            child: Column(
              children: [

                /// 🔝 TOP BAR
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// LEFT SIDE
                      Row(
                        children: [

                          /// LIVE TAG
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "LIVE",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),

                          const SizedBox(width: 10),

                          /// VIEWERS
                          const Row(
                            children: [
                              Icon(Icons.remove_red_eye, color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Text("5.2K", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),

                      /// RIGHT SIDE
                      Row(
                        children: [

                          /// COINS
                          Row(
                            children: [
                              const Icon(Icons.monetization_on, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(
                                "$coins",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),

                          const SizedBox(width: 10),

                          /// CLOSE
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                /// 💬 CHAT + GIFT AREA
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// CHAT LIST
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                messages[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// GIFT NOTIFICATION (UI ONLY)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "🔥 Lila89 sent a gift +500",
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 🎛️ CONTROL BAR
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// MUTE
                      _controlButton(Icons.mic_off, "Mute"),

                      /// FLIP CAMERA
                      GestureDetector(
                    onTap: switchCamera,
                    child: _controlButton(Icons.cameraswitch, "Flip"),
                    ),

                      /// SHARE
                      _controlButton(Icons.share, "Share"),

                      /// END LIVE
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "END",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔘 REUSABLE BUTTON
  Widget _controlButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black54,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }
}
