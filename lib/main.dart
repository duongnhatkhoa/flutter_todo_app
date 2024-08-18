import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColor: Colors.yellow,
        canvasColor: Colors.yellow[200],
        appBarTheme: AppBarTheme(
          color: Colors.yellow[700], // Explicitly set the AppBar color here
      ),),
    );
  }
}
