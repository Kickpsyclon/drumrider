import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Soundauswahl'),
        ),
        body: SoundSelection(),
      ),
    );
  }
}

class SoundSelection extends StatelessWidget {
  final assets = [
    'assets/audio/sound1.mp3',
    'assets/audio/sound2.mp3',
    // Add more audio files as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: assets.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Sound ${index + 1}'),
          onTap: () {
            _playSound(context, assets[index]);
          },
        );
      },
    );
  }

  void _playSound(BuildContext context, String assetPath) {
    AssetsAudioPlayer.playAndForget(
      Audio(assetPath),
    );
  }
}
