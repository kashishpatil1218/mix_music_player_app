import 'package:flutter/material.dart';





class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recently Played Section
              _buildSectionHeader('Recently Played'),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildRecentlyPlayedItem(
                      'Riding Forever, By',
                      'Savannah Blake',
                    ),
                    _buildRecentlyPlayedItem(
                      'Bailar Contigo, By',
                      'Estrella Sol',
                    ),
                    _buildRecentlyPlayedItem(
                      'Fire In The Rain',
                      'Dorian Luxe',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Mixes Section
              _buildSectionHeader('Mixes'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildMixItem('Midnight Confetti', 'Clara Skye'),
                    _buildMixItem('Dancing In The Shadows', 'Nova Lyric'),
                    _buildMixItem('Echoes Of Thunder', 'The Ashfall Collective'),
                    _buildMixItem('Broken Strings', 'Rusted Horizon'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Shows For You Section
              _buildSectionHeader('Shows For You'),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildShowItem('Chit-Chat With Cassie'),
                    _buildShowItem('Talks With Tony'),
                  ],
                ),
              ),
              const SizedBox(height: 80), // Space for bottom navigation
            ],
          ),

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
              fontWeight: FontWeight.bold,
              color: Colors.white
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

  Widget _buildRecentlyPlayedItem(String title, String artist) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 15,color:Colors.white),
            maxLines: 1,

            overflow: TextOverflow.ellipsis,
          ),
          Text(
            artist,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMixItem(String title, String artist) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
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
                    color: Colors.grey[400],
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

  Widget _buildShowItem(String title) {
    return Container(
      width: 144,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 144,
                width: 144,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12,color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Widget _buildBottomNavigationBar() {
  //   return Container(
  //     height: 70,
  //     decoration: BoxDecoration(
  //       color: Colors.grey[900],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         IconButton(
  //           icon: const Icon(Icons.home),
  //           onPressed: () => setState(() => _selectedIndex = 0),
  //         ),
  //         Container(
  //           decoration: const BoxDecoration(
  //             color: Colors.red,
  //             shape: BoxShape.circle,
  //           ),
  //           child: IconButton(
  //             icon: const Icon(
  //               Icons.play_arrow,
  //               color: Colors.white,
  //             ),
  //             onPressed: () {},
  //           ),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.favorite_border),
  //           onPressed: () => setState(() => _selectedIndex = 2),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.search),
  //           onPressed: () => setState(() => _selectedIndex = 3),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.person_outline),
  //           onPressed: () => setState(() => _selectedIndex = 4),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

