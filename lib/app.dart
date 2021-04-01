import 'package:denise_villani/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Social Hackathon",
        home: Home(),
        theme: ThemeData(primarySwatch: Colors.red),

      );
}
