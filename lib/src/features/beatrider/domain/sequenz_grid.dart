import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sequenz-Grid'),
        ),
        body: SequenzGrid(),
      ),
    );
  }
}

class SequenzGrid extends StatelessWidget {
  // Dummy data for sequence
  final List<int> sequence = List.generate(20, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
        crossAxisSpacing: 4.0, // Spacing between columns
        mainAxisSpacing: 4.0, // Spacing between rows
      ),
      itemCount: sequence.length,
      itemBuilder: (BuildContext context, int index) {
        // You can customize each grid item here
        return GridTile(
          child: Container(
            color: Color.fromARGB(255, 99, 153, 246),
            child: Center(
              child: Text(
                '${sequence[index]}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
