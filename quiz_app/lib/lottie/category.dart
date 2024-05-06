import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget CategoryBuilder(String Category_name) {
  print(Category_name);

  return LottieBuilder.asset("lib/assets/Category_$Category_name.json");
}

Widget PngBuilder(String Category_name) {
  return Image(
    image: AssetImage('lib/assets/Category_$Category_name.png'),
  );


}
