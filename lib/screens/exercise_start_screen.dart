import 'package:fitness/screens/exercise_hub.dart';
import 'package:fitness/screens/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseStartScreen({required this.exercise});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: widget.exercise.id,
          child: Stack(
            children: [
              Image(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(widget.exercise.thumbnail),
                fit: BoxFit.cover,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  // Color(0xFFE83350),
                  Color(0xFF000000),
                  Color(0x00000000),
                ], begin: Alignment.bottomCenter, end: Alignment.center)),
              ),
              Positioned(
                bottom: 40,
                right: 0,
                left: 0,
                child: Container(
                  height: 200,
                  width: 200,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(),
                    onChange: (double value) {
                      seconds = value.toInt();
                    },
                    initialValue: 30,
                    min: 10,
                    max: 60,
                    innerWidget: (v) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          " ${v.toInt()} S",
                          style: TextStyle(color: Colors.white54, fontSize: 30),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseScreen(
                              exercise: widget.exercise, seconds: seconds)
                      ),
                    );
                  },
                  child:Text("Start Exercise",style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    primary: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
