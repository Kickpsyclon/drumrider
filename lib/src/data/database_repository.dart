import 'package:flutter/material.dart';

void main() {
  runApp(StepSequencerApp());
}

class StepSequencerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepsequenzer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stepsequenzer'),
        ),
        body: StepSequencerGrid(databaseRepository: DatabaseRepository()),
      ),
    );
  }
}

class DatabaseRepository {
  List<List<int>> loadSequenceFromDatabase() {
    // Hier würden die Daten aus der echten Datenbank geladen werden
    // Für das Mockup geben wir hier einfach null zurück, um zu simulieren, dass keine Daten vorhanden sind
    return null;
  }

  void saveSequenceToDatabase(List<List<int>> sequence) {
    // Hier würden die Daten in die echte Datenbank gespeichert werden
    // Für das Mockup geben wir hier nur die Daten auf der Konsole aus
    print('Sequence saved to database: $sequence');
  }
}

class StepSequencerGrid extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  StepSequencerGrid({Key key, @required this.databaseRepository}) : super(key: key);

  @override
  _StepSequencerGridState createState() => _StepSequencerGridState();
}

class _StepSequencerGridState extends State<StepSequencerGrid> {
  int numBeats = 16;
  int numTracks = 4;
  List<List<int>> sequence;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Beim Start der App werden die Sequenzdaten aus der Datenbank geladen
    sequence = widget.databaseRepository.loadSequenceFromDatabase() ??
        List.generate(4, (_) => List.filled(16, 0));
  }

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
                widget.databaseRepository.saveSequenceToDatabase(sequence);
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
