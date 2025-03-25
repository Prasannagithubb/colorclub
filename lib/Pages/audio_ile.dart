import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;

  late AudioPlayer _player;
  List<String> tracks = [
    'assets/BGM8.mp3',
    'assets/BGM9.mp3'
  ]; // Add your tracks here
  int currentTrackIndex = 0;

  AudioService._internal() {
    _player = AudioPlayer();
    _player.onPlayerComplete.listen((event) {
      _playNextTrack(); // When one track completes, play the next
    });
  }

  Future<void> startMusic() async {
    await _playNextTrack(); // Start the first track
  }

  Future<void> _playNextTrack() async {
    currentTrackIndex =
        (currentTrackIndex + 1) % tracks.length; // Alternate tracks
    await _player.play(AssetSource(tracks[currentTrackIndex]));
  }
}
