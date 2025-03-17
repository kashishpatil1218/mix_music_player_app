// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class DiscoverPage extends StatefulWidget {
//   const DiscoverPage({super.key});
//
//   @override
//   State<DiscoverPage> createState() => _DiscoverPageState();
// }
//
// class _DiscoverPageState extends State<DiscoverPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';




class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _selectedIndex = 0;
  int _selectedGenre = 0;

  final List<String> _genres = ['Pop', 'Rock', 'Jazz', 'Classical', 'Metal'];

  @override
  Widget build(BuildContext context) {
    var providertrue=Provider.of<HomeController>(context,listen: true);
    var providerFalse=Provider.of<HomeController>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Discover Section
                _buildSectionHeader('Discover'),
                const SizedBox(height: 16),

                // Genre Tabs
                SizedBox(
                  height: 40,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _genres.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedGenre = index;
                            });
                          },
                          child: Text(
                            _genres[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _selectedGenre == index
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),


                Expanded(
                  child: FutureBuilder(
                    future: providerFalse.gstListOfSong(search: "hindi"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(child: Text('Error fetching data!', style: TextStyle(color: Colors.white)));
                      }
                      if (!snapshot.hasData || snapshot.data?.data.result.isEmpty == true) {
                        return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
                      }

                      final songList = snapshot.data!.data.result;

                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: ListView.builder(
                          itemCount: songList.length,
                          itemBuilder: (context, index) {
                            return _buildSongItem(songList[index].name, songList[index].label);
                          },
                        ),
                      );
                    },
                  ),
                ),

                // Songs List

                // Popular Artists Section
                _buildSectionHeader('Popular Artists'),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildArtistItem(),
                      _buildArtistItem(),
                      _buildArtistItem(),
                      _buildArtistItem(),
                    ],
                  ),
                ),
                const SizedBox(height: 100), // Space for player and bottom nav
              ],
            ),

            // Player Bar
            Positioned(
              bottom: 15, // Height of bottom navigation
              left: 16,
              right: 16,
              child: _buildPlayerBar(),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,color: Colors.white
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverItem(String title, String artist) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    artist,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongItem(String title, String artist) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15,color: Colors.white),
                ),
                Text(
                  artist,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.play_arrow,
            color: Colors.red[600],
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildArtistItem() {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildPlayerBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.red,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Neon Pulse',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,

                  ),
                ),
                Text(
                  'Lil Mystic',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.pause,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.skip_next,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

}

