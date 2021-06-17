import 'dart:async';

import 'package:fitness/screens/exercise_hub.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  final int seconds;

  const ExerciseScreen({required this.exercise, required this.seconds});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool _isCompleted = false;
  int _elapsedSeconds = 0;
  late Timer _timer;


  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          _isCompleted = true;
        });
      }
      setState(() {
        _elapsedSeconds = t.tick;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 300,
                maxWidth: MediaQuery.of(context).size.width
              ),
              child: Image(
                height: 500,
                width: MediaQuery.of(context).size.width,
                image: NetworkImage(widget.exercise.gif),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _isCompleted != true
              ? Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SafeArea(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${_elapsedSeconds.toString()}/${widget.seconds} s",
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      ),
                    ),
                  ),
                )
              :RatingDialog(
                // your app's name?
                title: 'Rate the App',
    // encourage your user to leave a high rating?
    message:
    'Tap a star to set your rating',
    // your app's logo?
    image: Image.asset("assets/logo1.png",),
    submitButton: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
    print('rating: ${response.rating}, comment: ${response.comment}');

    // TODO: add your own logic
    if (response.rating < 3.0) {
    // send their comments to your email or anywhere you wish
    // ask the user to contact you instead of leaving a bad review
    } else {
    return null;
    }
    },
    ),
          SafeArea(child: IconButton(onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.close),),
          )
        ],
      ),
    );
  }
}
