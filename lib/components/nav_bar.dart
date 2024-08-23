import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const NavBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.015,
          vertical: h * 0.02,
        ),
        child: GNav(
          gap: 10,
          tabBorderRadius: 100,
          iconSize: 30,
          textSize: 18,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          color: Colors.red.shade400,
          tabBackgroundGradient: LinearGradient(
            colors: [
              Colors.red.shade400,
              Colors.red.shade500,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.01,
            vertical: h * 0.01,
          ),
          tabs: const [
            GButton(
              icon: CupertinoIcons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.category,
              text: "Categories",
            ),
            GButton(
              icon: CupertinoIcons.search,
              text: "Search",
            ),
            GButton(
              icon: CupertinoIcons.bookmark_solid,
              text: "Favourites",
            )
          ],
          onTabChange: widget.onTap,
          selectedIndex: 0,
        ),
      ),
    );
  }
}
