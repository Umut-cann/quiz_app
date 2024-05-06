import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:lottie/lottie.dart';
import 'package:quiz_app/models/quiz_Model.dart';

import '../servis.dart/get_service.dart';

class QuizCubit extends Cubit<List<QuestionModel>> {
  QuizCubit(List<QuestionModel> initialState) : super(initialState);
  bool questionsLoaded = false;
  int? selectedOptionIndex;
  int currentQuestionIndex = 0;
  int puan = 0;
  bool isfinish = false;
  late int length;
  int CorrectAnswer = 0;
  int inCorrectAnswer = 0;

  bool checkAnswer2(int selectedOptionIndex) {
    if (selectedOptionIndex == state[currentQuestionIndex].correctOptionIndex) {
  
      print("doğru cevap");
      CorrectAnswer++;
      return true;
    } else {
      inCorrectAnswer++;
      print("yanlış");

      return false;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex + 1 < questionListt.length) {
      currentQuestionIndex++;
      selectedOptionIndex = null;
    } else {
      isfinish = true;
    }
    emit(List.from(state));
  }

  loadQuestionsByCategory(String categoryName) async {
    questionsLoaded = true;

    await get_service(categoryName);

   length= questionListt.length;
    emit(questionListt);
  }

  // ignore: non_constant_identifier_names

  Key LottieAnimation() {
    Key lottieKey;

    lottieKey = UniqueKey();

    return lottieKey;
  }
}
