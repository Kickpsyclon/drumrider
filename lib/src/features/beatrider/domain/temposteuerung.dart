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
          title: Text('Fart App'),
        ),
        body: FartPage(),
      ),
    );
  }
}

class FartPage extends StatefulWidget {
  @override
  _FartPageState createState() => _FartPageState();
}

class _FartPageState extends State<FartPage> {
  double _tempo = 1.0;
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer.open(Audio('assets/audio/fart_sound.mp3'));
    _assetsAudioPlayer.setPlaySpeed(_tempo);
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fart Tempo',
            style: TextStyle(fontSize: 24.0),
          ),
          Slider(
            value: _tempo,
            min: 0.5,
            max: 2.0,
            divisions: 15,
            label: 'Tempo: $_tempo',
            onChanged: (value) {
              setState(() {
                _tempo = value;
                _assetsAudioPlayer.setPlaySpeed(_tempo);
              });
            },
          ),
          RaisedButton(
            child: Text('Play Fart'),
            onPressed: () {
              _assetsAudioPlayer.play();
            },
          ),
        ],
      ),
    );
  }
}
