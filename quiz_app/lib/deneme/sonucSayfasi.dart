import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/StateManagament/cubit.dart';
import 'package:quiz_app/main.dart';


class SonucSayfasi extends StatelessWidget {
  const SonucSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test sonuç sayfasi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children: [
          
            Text( " Doğru sayisi  ${quizCubit.CorrectAnswer.toString()}"),
           const SizedBox(
              height: 20,
            ),
              Text( " Yanlış sayisi  ${quizCubit.inCorrectAnswer.toString()}"),
 
                    SizedBox(height: MediaQuery.sizeOf(context).height *0.2,),

                   
                                      Text("Basari yüzdesi ${ (quizCubit.CorrectAnswer /quizCubit.length)*100} "),

                  
             
     ElevatedButton(onPressed:() {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryScreen()),
            );

     }, child: const Text("ana menu"))

            
          ],
        ),
      ),
    );
  }
}
