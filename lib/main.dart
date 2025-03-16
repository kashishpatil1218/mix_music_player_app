import 'package:flutter/material.dart';
import 'package:mix_music_player_app/controller/home_controller.dart';
import 'package:mix_music_player_app/screen/bottom_navigation.dart';
import 'package:mix_music_player_app/screen/home_page.dart';
import 'package:mix_music_player_app/screen/rendom.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigation(),
      ),
    );
  }
}

