import 'package:flutter/material.dart';
import 'package:gesture_music_app/components/neubox.dart';
import 'package:gesture_music_app/models/favorites_provider.dart';
import 'package:gesture_music_app/models/playlist_provider.dart';
import 'package:gesture_music_app/models/song.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PlaylistProvider, FavoritesProvider>(
      builder: (context, playlistProvider, favoriteProvider, child) {
        // get playlist
        final playlist = playlistProvider.playlist;

        // get current song
        final Song currentSong =
            playlist[playlistProvider.currentSongIndex ?? 0];

        // return scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),

                        // Title
                        const Text("N O W   P L A Y I N G "),

                        // menu
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Album art
                  NeuBox(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              currentSong.albumArtImagePath,
                            ),
                          ),

                          const SizedBox(
                            height: 25,
                          ),

                          // Song and artist
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 250, maxHeight: 20),
                                    child: Text(
                                      currentSong.artist,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              // Like button
                              IconButton(
                                onPressed: () {
                                  favoriteProvider
                                      .toggleFavorite(currentSong);
                                },
                                icon: Icon(favoriteProvider
                                        .isFavorite(currentSong)
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // misc bar
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Start time
                            Text(
                              formatDuration(playlistProvider.currentDuration),
                            ),

                            // End time
                            Text(
                                formatDuration(playlistProvider.totalDuration)),
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0),
                        ),
                        child: Slider(
                          min: 0,
                          max: playlistProvider.totalDuration.inSeconds
                              .toDouble(),
                          activeColor: Colors.indigo,
                          value: playlistProvider.currentDuration.inSeconds
                              .toDouble(),
                          onChanged: (value) {
                            // when slider is moved around
                          },
                          onChangeEnd: (double val) {
                            // when slider is released
                            playlistProvider
                                .seekPosition(Duration(seconds: val.toInt()));
                          },
                        ),
                      ),
                    ],
                  ),

                  // controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Previous
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            playlistProvider.playPrevious();
                          },
                          child: const NeuBox(
                            child: Icon(Icons.skip_previous),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      // Play
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            playlistProvider.pauseOrResume();
                          },
                          child: NeuBox(
                            child: Icon(playlistProvider.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      // Next
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            playlistProvider.playNext();
                          },
                          child: const NeuBox(
                            child: Icon(Icons.skip_next),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
