import 'package:dio/dio.dart';

import '../models/quiz_Model.dart';

class Question {
  String category;
  String question;
  List<String> options;
  String correctAnswer;

  Question(
      {required this.category,
      required this.question,
      required this.options,
      required this.correctAnswer});
}

List<QuestionModel> questionListt = [];

Future<void> get_service(String categoryName) async {
  final dio = Dio();
  questionListt = [];
  print(categoryName);
   int CategoryId=6  ;

  if (categoryName == "Geography") {
    CategoryId = 22;
  }
  if (categoryName == "Music") {
    CategoryId = 12;
  }
  if (categoryName == "Sports") {
    CategoryId = 21;
  }
  if (categoryName == "Movie") {
    CategoryId == 11;
  }

  if (categoryName == "Technology") {
    CategoryId = 18;
  }

  if (categoryName == "Science") {
    CategoryId = 17;
  }

//12 music
// 18 computers
// 21 sports

  try {
    print(CategoryId);
    print("servis çalıştı");
    final response = await dio.get(
        'https://opentdb.com/api.php?amount=10&category=$CategoryId&type=multiple');

    if (response.statusCode == 200) {
      for (int i = 0; i < 10; i++) {
        final category = response.data['results'][i]['category'];

        String questionText = response.data['results'][i]['question'];
        final options =
            List<String>.from(response.data['results'][i]['incorrect_answers']);
        final correctAnswer = response.data['results'][i]['correct_answer'];
        options.add(correctAnswer);
        options.shuffle();

        QuestionModel question = QuestionModel(
          id: "1",
          category: category,
          text: questionText,
          options: options,
          correctOptionIndex: options.indexOf(correctAnswer),
        );

        questionListt.add(question);
      }

      for (var question in questionListt) {
        print('Soru: ${question.text}');
      }

      for (var question in questionListt) {
        print('Kategori: ${question.category}');
        print('Soru: ${question.text.toString()}');
        print('Seçenekler: ${question.options}');
        print('Doğru Cevap: ${question.correctOptionIndex}');
        print('---');
      }
    } else {
      print('API\'den veri alınamadı. Hata kodu: ${response.statusCode}');
    }
  } catch (e) {
    print('Hata oluştu: $e');
  }
}
