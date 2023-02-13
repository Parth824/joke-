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
  Future<joka?>? data;
  late SharedPreferences sharedPreferences;

  getshar() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = api_helper.helper.getapi();
    getshar();
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
              
              // await sharedPreferences.setStringList("Myjoks", [k!]);
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
            FutureBuilder(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  return Center(
                    child: Container(
                      child: Text("${snapshot.data!.values}"),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    data = api_helper.helper.getapi();
                  });
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
