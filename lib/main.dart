import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = <String>[
      "Java",
      "Python",
      "Dart",
      "C#",
      "Javascript",
      "PHP",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Çark Çevirmece"),
      ),
      body: GestureDetector(
        onTap: (){
          setState(() {
            selected.add(
              Random().nextInt(item.length),
            );
          });
        },
        child: Column(
          children: [
          Expanded(
            child: FortuneWheel(
              items: [
                for (var items in item)
                  FortuneItem(
                      child: Text(items),
                  )
              ],
              selected: selected.stream,
            ),
          ),
        ],
        ),
      ),
    );
  }
}

