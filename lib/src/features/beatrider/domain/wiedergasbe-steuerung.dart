import 'package:flutter/material.dart';



class StepSequencerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepsequenzer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stepsequenzer'),
        ),
        body: StepSequencerGrid(),
      ),
    );
  }
}

class StepSequencerGrid extends StatefulWidget {
  @override
  _StepSequencerGridState createState() => _StepSequencerGridState();
}

class _StepSequencerGridState extends State<StepSequencerGrid> {
  int numBeats = 16;
  int numTracks = 4;
  List<List<int>> sequence = List.generate(4, (_) => List.filled(16, 0));

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: numTracks,
            itemBuilder: (context, trackIndex) {
              return Row(
                children: List.generate(numBeats, (beatIndex) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        sequence[trackIndex][beatIndex] =
                            sequence[trackIndex][beatIndex] == 0 ? 1 : 0;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.all(2),
                      color: sequence[trackIndex][beatIndex] == 1
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                  // Hier kann die Abspiellogik eingefügt werden
                });
              },
              child: Text(isPlaying ? 'Pause' : 'Play'),
            ),
            SizedBox(width: 20),
            RaisedButton(
              onPressed: () {
                // Hier kann die Stopp-Logik eingefügt werden
              },
              child: Text('Stop'),
            ),
            SizedBox(width: 20),
            RaisedButton(
              onPressed: () {
                // Hier kann die Export-Logik eingefügt werden
              },
              child: Text('Export'),
            ),
          ],
        ),
      ],
    );
  }
}
