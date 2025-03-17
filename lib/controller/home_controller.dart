import 'package:flutter/material.dart';
import 'package:mix_music_player_app/screen/discover_page.dart';
import 'package:mix_music_player_app/screen/home_page.dart';
import 'package:mix_music_player_app/screen/like_page.dart';
import 'package:mix_music_player_app/screen/search_page.dart';

import '../helper/api_helper.dart';
import '../modal/sogn_modal.dart';

class HomeController extends ChangeNotifier {
  int screenIndex = 0;
  List screenList = [DiscoverPage(), HomePage(), LikePage(), SearchPage()];

  void changeIndex(int index) {
    screenIndex = index;
    notifyListeners();
  }

  SongModel? songModel;

  Future<SongModel?> gstListOfSong({required String search}) async {
    Map data = await ApiService.apiService.fetchApiData(search);
    songModel = SongModel.fromMap(data);
    notifyListeners();
    return songModel;
  }
}
