import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/StateManagament/cubit.dart';
import 'package:quiz_app/deneme/sonucSayfasi.dart';
import 'package:quiz_app/main.dart';


import '../models/quiz_Model.dart';




import '../servis.dart/get_service.dart';



class Deneme extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String CategoryName;

 const   Deneme({super.key, required this.CategoryName});

  final Color myHexColor =
      const Color(0xFF6C63FF); 

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();

 try {
   quizCubit.loadQuestionsByCategory(CategoryName);
} catch (e) {
  print('Error loading questions: $e');
}

  quizCubit.loadQuestionsByCategory(CategoryName);

    return BlocBuilder<QuizCubit, List<QuestionModel>>(
      builder: (context, state) {
        return MaterialApp(
          home: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: myHexColor,
                title: Center(child: Text(CategoryName)),
              ),
              backgroundColor: Colors.blueGrey[200],
              body: questionListt.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        
                          
                        SizedBox(
                            height: 100,
                            child: Lottie.asset(
                              "lib/assets/countdown.json",
                              key: quizCubit.LottieAnimation(), repeat: false,

                      
                            )),
                        ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Column(
                            children: [
                              Text(
                                "${quizCubit.currentQuestionIndex + 1} / ${state.length}",

                              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(state[quizCubit.currentQuestionIndex].text),
                              Column(
                                children: state[quizCubit.currentQuestionIndex]
                                    .options
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int optionIndex = entry.key;
                                  String option = entry.value;
                                  return secenekler(
                                    quizCubit,
                                    optionIndex,
                                    option,
                                    state,
                                    context,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoryScreen()),
                            );
                          },
                          child: const Text("Ana Menü"),
                        )
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  SizedBox animation() {
    return SizedBox(
      height: 100,
      child: Lottie.asset(
        "lib/assets/countdown.json",

      ),
    );
  }

 

  ElevatedButton secenekler(QuizCubit quizCubit, int optionIndex, String option,
      List<QuestionModel> state, context) {
    Color buttonColor;
    if (quizCubit.selectedOptionIndex == optionIndex) {
      buttonColor =
          quizCubit.checkAnswer2(optionIndex) ? Colors.green : Colors.red;
    } else {
      buttonColor = Colors.white;
    }

    return ElevatedButton(
      onPressed: quizCubit.selectedOptionIndex == null
          ? () {
              
              quizCubit.selectedOptionIndex = optionIndex;

           
              quizCubit.emit(List.from(quizCubit.state));



              Future.delayed(const Duration(milliseconds: 600), () {
                if (quizCubit.currentQuestionIndex + 1 >=
                    quizCubit.state.length) {
                  print("Quiz bitti");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SonucSayfasi()), 
                  );
                } else {
                  quizCubit.nextQuestion();
                }
              });
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 3),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        alignment: Alignment.centerLeft,
        constraints: const BoxConstraints(minWidth: 400, minHeight: 50),
        child: Text(
          '$option ',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
 

 











