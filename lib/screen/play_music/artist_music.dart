import 'package:flutter/material.dart';
import 'package:mix_music_player_app/uitls/global.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';
import '../../modal/sogn_modal.dart';
import '../discover_page.dart';
import 'music_player.dart';

class ArtistMusic extends StatelessWidget {
  ArtistMusic({super.key, required this.selectedIndex, required this.temp});

  List<Result> temp;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var providertrue = Provider.of<HomeController>(context, listen: true);
    var providerFalse = Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        title: Text(
          '${artists[selectedIndex]['name']}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: temp.length,
        itemBuilder:
            (context, index) => ListTile(
              onTap: () {
                providerFalse.updateIndex(index);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MusicPlayerScreen()),
                );
              },
              leading: Container(
                width: 40, // Adjust size as needed
                height: 40, // Adjust size as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // Slight rounding, use 0 for sharp edges
                  image: DecorationImage(
                    image: NetworkImage(temp[index].images[1].url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                temp[index].name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                temp[index].label,
                style: TextStyle(color: Colors.white),
              ),
            ),
      ),
    );
  }
}
