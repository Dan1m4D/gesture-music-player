import 'package:flutter/material.dart';
import 'package:gesture_music_app/components/neubox.dart';
import 'package:gesture_music_app/components/neuitem.dart';
import 'package:gesture_music_app/models/playlist_provider.dart';
import 'package:gesture_music_app/models/song.dart';
import 'package:gesture_music_app/pages/playerpage.dart';
import 'package:provider/provider.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistProvider =
        Provider.of<PlaylistProvider>(context, listen: false);

    void goToSong(int index) {
      playlistProvider.currentSongIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PlayerPage()),
      );
    }

    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        final List<Song> playlist = value.playlist;

        return ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            final Song song = playlist[index];

            return NeuListItem(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(song.albumArtImagePath),
                ),
                title: Text(song.title),
                subtitle: Text(
                  song.artist,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => goToSong(index),
              ),
            );
          },
        );
      },
    );
  }
}
