import 'package:flutter/material.dart';
import 'package:jokeapp/helper/apihleper.dart';

class savedata extends StatefulWidget {
  const savedata({super.key});

  @override
  State<savedata> createState() => _savedataState();
}

class _savedataState extends State<savedata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ...api_helper.helper.jokes_data!.map(
            (e) => ListTile(),
          ),
        ],
      ),
    );
  }
}
