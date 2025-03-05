import 'package:flutter/material.dart';
import 'web_page.dart'; // Import the WebPage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebPage(), // Use the WebPage widget
    );
  }
}
