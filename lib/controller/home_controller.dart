import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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
  bool isFavorite = false;
  final _player = AudioPlayer();
  String searchFiled = '';
  int currentMusinIndex = 0;
  var txtSearch = TextEditingController();
  Duration duration = Duration(seconds: 0);
  double position = 0;
  bool isPlay = false;
  List<Map<String, dynamic>> favouriteSongs = [];

  Future<SongModel?> gstListOfSong({required String search}) async {
    Map data = await ApiService.apiService.fetchApiData(search);
    songModel = SongModel.fromMap(data);
    notifyListeners();
    return songModel;
  }
  void searchSong(var search) {
    searchFiled = search;
    gstListOfSong(search: searchFiled);
    notifyListeners();
  }
  Future<void> loadAudio() async {
    if (songModel != null && songModel!.data.result.isNotEmpty) {
      log(" ${songModel!.data.result[currentMusinIndex].downloadUrl[2].url}");
      duration =
          await _player.setUrl(
            songModel!.data.result[currentMusinIndex].downloadUrl[2].url,
          ) ??
              Duration(seconds: 0);
      notifyListeners();
    }
  }

  Future<void> playAudio(var value) async {
    isPlay = !value;
    notifyListeners();
    if (!isPlay) {
      await _player.pause();
    } else {
      await _player.play();
    }
    notifyListeners();
  }
  void setFavorite(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  void updateIndex(int index) {
    currentMusinIndex = index;
    notifyListeners();
  }

  Future<void> seekAudio(double value) async {
    await _player.seek(Duration(seconds: value.toInt()));

    notifyListeners();
  }

  Stream<Duration> sliderPlaySeek() {
    return _player.positionStream;
  }
}
