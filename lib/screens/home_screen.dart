import 'package:flutter/material.dart';

/*import 'profile_screen.dart';
import 'favourites_screen.dart';
import 'membership_screen.dart';
import 'order_screen.dart';*/

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    Container(
      color: const Color(0xff263238),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              SizedBox(height: 50,),
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ]
        ),),),
    //orderPage(),
    //favouritesPage(),
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