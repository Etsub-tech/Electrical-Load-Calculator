import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';
void main() {
runApp(const ElectricalLoadApp());
}
class ElectricalLoadApp extends StatelessWidget {
const ElectricalLoadApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Electrical Load Calculator',
debugShowCheckedModeBanner: false,
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
useMaterial3: true,
),
home: const CalculatorScreen(),
);
}
}