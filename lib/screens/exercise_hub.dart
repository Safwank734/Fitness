// To parse this JSON data, do
//
//     final exerciseHub = exerciseHubFromJson(jsonString);

import 'dart:convert';

ExerciseHub exerciseHubFromJson(String str) => ExerciseHub.fromJson(json.decode(str));

String exerciseHubToJson(ExerciseHub data) => json.encode(data.toJson());

class ExerciseHub {
  ExerciseHub({
    required this.exercises,
  });

  List<Exercise> exercises;

  factory ExerciseHub.fromJson(Map<String, dynamic> json) => ExerciseHub(
    exercises: List<Exercise>.from(json["exercises"].map((x) => Exercise.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
  };
}

class Exercise {
  Exercise({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.gif,
    required this.seconds,
  });

  String id;
  String title;
  String thumbnail;
  String gif;
  String seconds;

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    gif: json["gif"],
    seconds: json["seconds"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "thumbnail": thumbnail,
    "gif": gif,
    "seconds": seconds,
  };
}
