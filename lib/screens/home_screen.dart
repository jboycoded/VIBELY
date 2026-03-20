import 'package:flutter/material.dart';

import 'match/random_match_screen.dart';

import 'home/home_content.dart';

import 'chats/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> pages = [
  const HomeContent(), // your current home UI
  const RandomMatchScreen(),
  const Center(child: Text("Go Live")),
  const ChatsScreen(),
  const Center(child: Text("Profile")),
];

  // Stores which bottom navigation item is selected
  int selectedIndex = 0;

  // Function when bottom navigation item is tapped
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF0D0A1F),

      body: pages[selectedIndex],

      /// BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomAppBar(

        color: const Color(0xFF15102E),

        child: SizedBox(

          height:70,

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [

              navItem(Icons.home,0),

              navItem(Icons.shuffle,1),

              goLiveButton(),

              navItem(Icons.chat_bubble_outline,3),

              navItem(Icons.person_outline,4),

            ],
          ),
        ),
      ),
    );
  }


/// BOTTOM NAVIGATION ITEM
Widget navItem(IconData icon,int index){

  bool isSelected = selectedIndex == index;

  return IconButton(

    icon: Icon(
      icon,
      color: isSelected ? Colors.pink : Colors.white,
    ),

    onPressed: (){
      onItemTapped(index);
    },

  );
}

   /// GO LIVE BUTTON
Widget goLiveButton(){

  return Container(

    height:60,
    width:60,

    decoration: const BoxDecoration(

      shape: BoxShape.circle,

      gradient: LinearGradient(
        colors: [
          Color(0xFF7B3BFF),
          Color(0xFFFF4D8D),
        ],
      ),

    ),

    child: const Icon(
      Icons.videocam,
      color: Colors.white,
      size:28,
    ),

  );
}

}    
