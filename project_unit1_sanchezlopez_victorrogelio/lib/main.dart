import 'package:flutter/material.dart';
import 'package:project_unit1_sanchezlopez_victorrogelio/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final double zero = 0;
  const MyApp([Key? key]):super(key: key);

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homescreen(15),
  );
}
}
