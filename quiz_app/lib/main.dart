
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/StateManagament/cubit.dart';
import 'package:quiz_app/controller/control.dart';
import 'package:quiz_app/deneme/deneme.dart';
import 'package:quiz_app/lottie/category.dart';
import '../servis.dart/get_service.dart';

void main() {
  runApp(const CategoryScreen());
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {


  
    return BlocProvider(
        create: (_) => QuizCubit(questionListt), child: const MyApp());
   
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Category Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Category')),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
           
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Deneme(CategoryName: categories[index].name),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                        child:

                            PngBuilder(categories[index].name)),

                  ),
                  Text(categories[index].name),

            
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}