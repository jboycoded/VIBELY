import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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

      body: SafeArea(

        child: Column(

          children: [

            /// TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  /// APP LOGO
                  Row(
                    children: [

                      Image.asset(
                        "assets/images/vibely_icon.jpg",
                        height: 28,
                      ),

                      const SizedBox(width:8),

                      const Text(
                        "VIBELY",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),

                  /// SEARCH + FILTER BUTTONS
                  Row(
                    children: [

                      IconButton(
                        icon: const Icon(Icons.search,color: Colors.white),
                        onPressed: (){},
                      ),

                      IconButton(
                        icon: const Icon(Icons.tune,color: Colors.white),
                        onPressed: (){},
                      ),

                    ],
                  )

                ],
              ),
            ),

            /// CATEGORY BUTTONS
            SizedBox(

              height: 40,

              child: ListView(

                scrollDirection: Axis.horizontal,

                children: [

                  categoryButton("Popular"),
                  categoryButton("Nearby"),
                  categoryButton("Featured"),
                  categoryButton("New"),
                  categoryButton("Top Hosts"),

                ],
              ),
            ),

            const SizedBox(height:10),

            /// LIVE STREAM GRID
            Expanded(

              child: GridView.count(

                crossAxisCount: 2,

                childAspectRatio: 0.75,

                padding: const EdgeInsets.all(12),

                children: [

                  liveCard("Lovisa","2.3K","assets/images/stream1.jpg"),
                  liveCard("David","801","assets/images/stream2.jpg"),
                  liveCard("Mia","530","assets/images/stream3.jpg"),
                  liveCard("Jenny","167","assets/images/stream4.jpg"),

                ],
              ),
            )

          ],
        ),
      ),

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


/// CATEGORY BUTTON
Widget categoryButton(String text){

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:6),

    child: Container(

      padding: const EdgeInsets.symmetric(horizontal:18),

      decoration: BoxDecoration(

        color: const Color(0xFF1A1435),

        borderRadius: BorderRadius.circular(20),

      ),

      alignment: Alignment.center,

      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),

    ),
  );
}


/// LIVE STREAM CARD
Widget liveCard(String name,String viewers,String image){

  return Padding(

    padding: const EdgeInsets.all(6),

    child: ClipRRect(

      borderRadius: BorderRadius.circular(16),

      child: Stack(

        children: [

          /// STREAM IMAGE
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          /// LIVE TAG
          Positioned(

            top:10,
            left:10,

            child: Container(

              padding: const EdgeInsets.symmetric(horizontal:8,vertical:4),

              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),

              child: const Text(
                "LIVE",
                style: TextStyle(color: Colors.white,fontSize:12),
              ),

            ),
          ),

          /// VIEWERS COUNT
          Positioned(

            top:10,
            right:10,

            child: Row(

              children: [

                const Icon(Icons.remove_red_eye,color: Colors.white,size:16),

                const SizedBox(width:4),

                Text(
                  viewers,
                  style: const TextStyle(color: Colors.white),
                )

              ],
            ),
          ),

          /// STREAMER NAME
          Positioned(

            bottom:10,
            left:10,

            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )

        ],
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

}    //favouritesPage(),
    //membershipPage(),
    //profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.white, width: 0.5)
            )
        ),
        child: BottomNavigationBar(
          elevation: 10,
          backgroundColor: const Color(0xff263238),
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.offline_bolt),
                label: 'Orders'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourites'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                label: 'Membership'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile'
            ),
          ],
        ),),
    );
  }
}
