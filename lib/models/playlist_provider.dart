import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gesture_music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      title: "Friend Like Me",
      artist: "Will Smith",
      albumArtImagePath: "assets/covers/aladin.jpg",
      songPath: "audio/friend_like_me.mpeg",
    ),
    Song(
      title: "Bad Guy",
      artist: "Billie Eilish",
      albumArtImagePath: "assets/covers/bad_guy.jpeg",
      songPath: "audio/bad_guy.mpeg",
    ),
    Song(
      title: "The Greatest Show",
      artist: "Hugh Jackman, Keala Settle, Zac Efron, Zendaya",
      albumArtImagePath: "assets/covers/the_greatest_showman.jpg",
      songPath: "audio/the_greatest_showman.mpeg",
    ),
    Song(
      title: "Antes dela dizer que sim",
      artist: "Barbara Tinoco",
      albumArtImagePath: "assets/covers/antes_dela.jpg",
      songPath: "audio/antes_dela.mpeg",
    ),
  ];

  // current song playing
  int? _currentSongIndex = 0;

  /*
    A U D I O   P L A Y E R
  */

  // Audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // Play
  void play() async {
    final String songPath = _playlist[_currentSongIndex!].songPath;
    await _audioPlayer.play(AssetSource(songPath));
    _isPlaying = true;
    notifyListeners();
  }

  // Pause
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek position
  void seekPosition(Duration duration) async {
    await _audioPlayer.seek(duration);
  }

  // play next
  void playNext() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
      notifyListeners();
    }
  }

  // play previous
  void playPrevious() {
    if (_currentSongIndex != null) {
      if (_currentDuration.inSeconds > 2) {
        _audioPlayer.seek(Duration.zero);
      } else {
        if (_currentSongIndex! > 0) {
          currentSongIndex = _currentSongIndex! - 1;
        } else {
          currentSongIndex = _playlist.length - 1;
        }
      }
      notifyListeners();
    }
  }

  //listen for song completion
  void listenForSongCompletion() {
    _audioPlayer.onPlayerComplete.listen((event) {
      playNext();
    });
  }

  // listen to duration
  void listenToDuration() {
    // listen to current duration
    _audioPlayer.onDurationChanged.listen((Duration? duration) {
      _totalDuration = duration!;
      notifyListeners();
    });

    // listen to total duration
    _audioPlayer.onPositionChanged.listen((Duration? duration) {
      _currentDuration = duration!;
      notifyListeners();
    });

    // listen to song completion
    _audioPlayer.onPlayerComplete.listen((event) {});
  }

  /* 
    G E T T E R S
  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /* 
    S E T T E R S
  */
  set currentSongIndex(int? index) {
    _currentSongIndex = index;

    if (index != null) {
      play();
    }

    // update ui
    notifyListeners();
  }
}
