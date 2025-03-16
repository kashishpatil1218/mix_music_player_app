import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mix_music_player_app/controller/home_controller.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          context.watch<HomeController>().screenList[context
              .watch<HomeController>()
              .screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.black,
        onTap: (value) {
          context.read<HomeController>().changeIndex(value);
        },
        items: [
          Icon(Icons.add_circle_outlined,color: Colors.white,size: 30,),
          Icon(Icons.home_filled,color: Colors.white,size: 30),
          Icon(Icons.favorite_border,color: Colors.white,size: 30),
          Icon(Icons.search,color: Colors.white,size: 30),
        ],
      ),
    );
  }
}
