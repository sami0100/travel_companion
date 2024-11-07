import 'package:flutter/material.dart';
import 'home.dart'; // Import the new HomeScreen file
import 'screens/grid_view_screen.dart'; // Import GridViewScreen to use in the routes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Companion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Set HomeScreen as the home widget
      debugShowCheckedModeBanner: false,
      routes: {
        '/grid': (context) => GridViewScreen(), // Ensure this route exists in the project
      },
    );
  }
}
