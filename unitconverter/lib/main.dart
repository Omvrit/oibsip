import 'package:flutter/material.dart';
import 'package:unitconverter.dart/store.dart';
import 'package:unitconverter.dart/unitconverter.dart';
import 'package:velocity_x/velocity_x.dart';


void main() {
  runApp(VxState(
    store: UnitConverterStore(),
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false ,
        home:UnitConverter()
      );
  }
}
