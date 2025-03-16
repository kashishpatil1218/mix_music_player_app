

import 'package:flutter/material.dart';
import 'package:mix_music_player_app/screen/discover_page.dart';
import 'package:mix_music_player_app/screen/home_page.dart';
import 'package:mix_music_player_app/screen/like_page.dart';
import 'package:mix_music_player_app/screen/search_page.dart';

class HomeController extends ChangeNotifier{

int screenIndex = 0;
  List screenList =[
    DiscoverPage(),
    HomePage(),
    LikePage(),
    SearchPage(),];

  void changeIndex(int index){
    screenIndex = index;
    notifyListeners();
  }
}