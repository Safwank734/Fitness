import 'dart:convert';

import 'package:fitness/screens/exercise_hub.dart';
import 'package:fitness/screens/exercise_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiURL =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";
  ExerciseHub? exerciseHub;

  @override
  void initState() {
    setState(() {
      getExercises();
    });
    super.initState();
  }

  void getExercises() async {
    var response = await http.get(Uri.parse(apiURL));
    var json = response.body;
    var decodedJson = jsonDecode(json);
    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness"),
      ),
      body: Container(
        child: exerciseHub != null
            ? ListView.builder(
                itemCount: exerciseHub!.exercises.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseStartScreen(exercise: exerciseHub!.exercises[index],)
                        ),
                      );
                    },
                    child: Hero(
                      tag: exerciseHub!.exercises[index].id,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FadeInImage(
                                placeholder: AssetImage("assets/fit1.jpeg"),
                                image: NetworkImage(
                                    exerciseHub!.exercises[index].thumbnail),
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Color(0xFF000000),
                                      Color(0x00000000),
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center)),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                child: Text(
                                  exerciseHub!.exercises[index].title,
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : LinearProgressIndicator(),
      ),
    );
  }
}
