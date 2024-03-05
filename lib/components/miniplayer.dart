import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gesture_music_app/components/neubox.dart';
import 'package:gesture_music_app/models/playlist_provider.dart';
import 'package:gesture_music_app/models/song.dart';
import 'package:provider/provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, pl, child) {
        final playlist = pl.playlist;

        // get current song
        final Song currentSong = playlist[pl.currentSongIndex ?? 0];

        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(25)),
          height: 120,
          child: NeuBox(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      currentSong.albumArtImagePath,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentSong.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        currentSong.artist,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),


                    SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Previous
                          GestureDetector(
                            onTap: () {
                              pl.playPrevious();
                            },
                            child: const Icon(Icons.skip_previous),
                          ),

                          // Play

                          GestureDetector(
                            onTap: () {
                              pl.pauseOrResume();
                            },
                            child: Icon(
                                pl.isPlaying ? Icons.pause : Icons.play_arrow),
                          ),

                          // Next
                          GestureDetector(
                            onTap: () {
                              pl.playNext();
                            },
                            child: const Icon(Icons.skip_next),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
