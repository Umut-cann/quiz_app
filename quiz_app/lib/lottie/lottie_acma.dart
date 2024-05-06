import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class lottie101 extends StatefulWidget {
  const lottie101({super.key});

  @override
  State<lottie101> createState() => _lottie101State();
}

class _lottie101State extends State<lottie101> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          
          Expanded(
            child: Lottie.asset("lib/assets/countdown.json",
             
                
                ),
          ),

        
        ],
      ),
    ));
  }
}
// ignore: non_constant_identifier_names
