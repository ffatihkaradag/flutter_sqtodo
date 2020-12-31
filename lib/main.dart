import 'package:flutter/material.dart';
import 'package:flutter_sqtodo/ui/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
