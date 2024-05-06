
//import 'package:flutter/cupertino.dart';

class QuestionModel {
  final String id;
   final  String text;
  final List<String> options;

  // int yap
  final int correctOptionIndex;
  final String category;

  QuestionModel({
    required this.id,
    required this.text,
    required this.options,
    required this.correctOptionIndex,
    required this.category,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      text: json['text'],
      options: List<String>.from(json['options']),
      correctOptionIndex: json['correctOptionIndex'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'options': options,
      'correctOptionIndex': correctOptionIndex,
      'category': category,
    };
  }
}
