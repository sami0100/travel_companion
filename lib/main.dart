// import 'package:flutter/material.dart';
// import 'home.dart'; // Import the new HomeScreen file
// import 'screens/grid_view_screen.dart'; // Import GridViewScreen to use in the routes
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Travel Companion',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(), // Set HomeScreen as the home widget
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/grid': (context) => GridViewScreen(), // Ensure this route exists in the project
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'home.dart';
import 'screens/grid_view_screen.dart'; // Added GridViewScreen import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC6GLJv1MpunRx7CDAn-WTkRIEkECDcqWc",
      authDomain: "travelcompanion-3679c.firebaseapp.com",
      projectId: "travelcompanion-3679c",
      storageBucket: "travelcompanion-3679c.firebasestorage.app",
      messagingSenderId: "17088177358",
      appId: "1:17088177358:web:5a9443e2f68ba6bbdddc9f",
      measurementId: "G-X5MR24X8TX",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Companion',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/grid': (context) => GridViewScreen(), // Added route for GridViewScreen
      },
    );
  }
}

