import 'package:api_revision/features/home/posts/presentation/posts_screen.dart';
import 'package:api_revision/features/home/products/presentation/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  //! ------------------------------------------------------------

  int currentIndex = 0;

  final List<Widget> screenPages = [const ProductScreen(), const PostsScreen()];

  //! ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenPages[currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Products'),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Posts'),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
