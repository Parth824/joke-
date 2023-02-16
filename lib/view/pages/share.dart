import 'package:flutter/material.dart';
import 'package:jokeapp/helper/apihleper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class savedata extends StatefulWidget {
  const savedata({super.key});

  @override
  State<savedata> createState() => _savedataState();
}

class _savedataState extends State<savedata> {
  late SharedPreferences sharedPreferences;
  List<String> k = [];
  mokeperf() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      k = sharedPreferences.getStringList("Myjoks")!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mokeperf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ...k.map(
            (e) => Card(
              child: ListTile(
                title: Text(e),
                trailing: InkWell(
                  onTap: () {
                    setState(() {
                      int i = k.indexOf(e);
                      print(k.indexOf(e));
                      api_helper.helper.jokes_data.removeAt(i);
                      sharedPreferences.setStringList(
                          "Myjoks", api_helper.helper.jokes_data);
                      k = sharedPreferences.getStringList("Myjoks")!;
                    });
                  },
                  child: Icon(Icons.delete),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
