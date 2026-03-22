import 'package:flutter/material.dart';

import '../streaming/live_streaming_screen.dart';

class GoLiveScreen extends StatefulWidget {
  const GoLiveScreen({super.key});

  @override
 State<GoLiveScreen> createState() => _GoLiveScreenState();
}

class _GoLiveScreenState extends State<GoLiveScreen> {

  final TextEditingController titleController = TextEditingController();

  /// FUNCTION: When user clicks GO LIVE
  void startLive(){

    if(titleController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a stream title")),
      );
      return;
    }

    /// Navigate to Live Screen (placeholder for now)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LiveStreamingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [

          /// BACKGROUND
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DARK OVERLAY
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),

              child: Column(
                children: [

                  /// TOP BAR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(
                        icon: const Icon(Icons.arrow_back,color: Colors.white),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),

                      const Text(
                        "Go Live",
                        style: TextStyle(color: Colors.white,fontSize:18),
                      ),

                      const SizedBox(width:40), // spacing
                    ],
                  ),

                  const SizedBox(height:30),

                  /// COVER IMAGE
                  GestureDetector(
                    onTap: (){
                      // later: open gallery
                    },
                    child: Container(
                      height: 180,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: const Color(0xFF1B1534),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Center(
                        child: Icon(Icons.add,color: Colors.white,size:40),
                      ),
                    ),
                  ),

                  const SizedBox(height:20),

                  /// TITLE INPUT
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:16),

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

                  /// GO LIVE BUTTON
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

                  const SizedBox(height:20),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
