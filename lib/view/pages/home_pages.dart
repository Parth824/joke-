import 'package:flutter/material.dart';
import 'package:jokeapp/helper/apihleper.dart';
import 'package:jokeapp/model/jok.dart';
import 'package:jokeapp/view/pages/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPreferences;

  joka? k;

  getshar() async {
    sharedPreferences = await SharedPreferences.getInstance();

    api_helper.helper.jokes_data =
        sharedPreferences.getStringList("Myjoks") ?? [];
  }

  getapi() async {
    k = await api_helper.helper.getapi();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getshar();
    getapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () async {
              api_helper.helper.jokes_data.add(k!.values);

              List<String> m = api_helper.helper.jokes_data;
              print(m);
              await sharedPreferences.setStringList("Myjoks", m);
              print(sharedPreferences.getStringList("Myjoks"));
            },
            child: Icon(Icons.save_alt),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => savedata(),
            ),
          );
        },
        child: Center(child: Icon(Icons.arrow_forward)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: (k?.values != null)
                  ? Center(child: Text("${k?.values}"))
                  : Center(child: CircularProgressIndicator()),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  k = await api_helper.helper.getapi() as joka?;
                  setState(() {});
                },
                child: Text("Fetch My Laugh"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
