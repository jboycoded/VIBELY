import 'package:flutter/material.dart';

class RandomMatchScreen extends StatefulWidget {
  const RandomMatchScreen({super.key});

  @override
  State<RandomMatchScreen> createState() => _RandomMatchScreenState();
}

class _RandomMatchScreenState extends State<RandomMatchScreen> {

  int userCoins = 1200; // User coin balance

  // Function for Next Match button
  void nextMatch() {

    int cost = 30;

    if(userCoins < cost){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Not enough coins")),
      );
      return;
    }

    setState(() {
      userCoins -= cost;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Matching...")),
    );

    // Later: connect to backend / matching algorithm
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

          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          SafeArea(

            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 16),

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
                        "Random Match",
                        style: TextStyle(color: Colors.white,fontSize:18),
                      ),

                      Row(
                        children: [

                          const Icon(Icons.monetization_on,color: Colors.orange),

                          const SizedBox(width:4),

                          Text(
                            "$userCoins",
                            style: const TextStyle(color: Colors.white),
                          )

                        ],
                      )

                    ],
                  ),

                  const SizedBox(height:20),

                  const Text(
                    "Matching...",
                    style: TextStyle(color: Colors.white70,fontSize:18),
                  ),

                  const SizedBox(height:20),

                  /// MAIN PROFILE IMAGE
                  Container(

                    height: 350,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/stream1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height:20),

                  /// USER INFO
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      const Text(
                        "Emma, 21 💎 1,660",
                        style: TextStyle(color: Colors.white),
                      ),

                      const Text(
                        "Jack, 22 💜",
                        style: TextStyle(color: Colors.white70),
                      )

                    ],
                  ),

                  const Spacer(),

                  /// GIFT BUTTONS
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      giftButton("x1"),
                      giftButton("30"),
                      giftButton("240"),

                    ],
                  ),

                  const SizedBox(height:20),

                  /// NEXT MATCH BUTTON
                  GestureDetector(

                    onTap: nextMatch,

                    child: Container(

                      height: 55,
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
                          "Next Match",
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

  /// GIFT BUTTON
  Widget giftButton(String text){

    return Container(

      padding: const EdgeInsets.symmetric(horizontal:20,vertical:12),

      decoration: BoxDecoration(
        color: const Color(0xFF1B1534),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          const Icon(Icons.favorite,color: Colors.pink),
          const SizedBox(width:6),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

}
