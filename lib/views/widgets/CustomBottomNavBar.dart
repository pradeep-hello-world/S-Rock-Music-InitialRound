import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF181818),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/home_icon.png',
            width: 24,
            height: 24,
            color: selectedIndex == 0 ? Colors.white : Colors.white54,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/News_icon.png',
            width: 24,
            height: 24,
            color: selectedIndex == 1 ? Colors.white : Colors.white54,
          ),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/TrackBox_icon.png',
            width: 24,
            height: 24,
            color: selectedIndex == 2 ? Colors.white : Colors.white54,
          ),
          label: 'TrackBox',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/Projects.png',
            width: 24,
            height: 24,
            color: selectedIndex == 3 ? Colors.white : Colors.white54,
          ),
          label: 'Projects',
        ),
      ],
    );
  }
}
