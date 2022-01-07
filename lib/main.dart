import 'package:flutter/material.dart';
import 'line_graph.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line Graph',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LineGraph(),
    );
  }
}