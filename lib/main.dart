import 'package:flutter/material.dart';
import 'screens/destination_explorer.dart'; // Import the Destination Explorer screen
import 'screens/packing_list.dart'; // Import the Packing List screen
import 'screens/plan_trip.dart'; // Import the Plan Trip screen

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _opacityExplore = 1.0;
  double _opacityPlan = 1.0;
  double _opacityPacking = 1.0;

  // Function to reduce opacity for button press effect
  void _onButtonPress(Function onPressed, String button) {
    setState(() {
      if (button == "Explore") _opacityExplore = 0.5;
      if (button == "Plan") _opacityPlan = 0.5;
      if (button == "Packing") _opacityPacking = 0.5;
    });
    Future.delayed(Duration(milliseconds: 150), () {
      setState(() {
        if (button == "Explore") _opacityExplore = 1.0;
        if (button == "Plan") _opacityPlan = 1.0;
        if (button == "Packing") _opacityPacking = 1.0;
      });
      onPressed();
    });
  }

  // Correct Navigation to Destination Explorer
  void _navigateToDestination() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DestinationExplorerScreen()));
  }

  void _navigateToPlanTrip() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PlanTripScreen()));
  }

  void _navigateToPackingList() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PackingListScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Companion'),
        elevation: 2,
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade300, Colors.blue.shade900],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Travel Companion!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              // Explore Button
              AnimatedOpacity(
                opacity: _opacityExplore,
                duration: Duration(milliseconds: 150),
                child: ElevatedButton(
                  onPressed: () => _onButtonPress(_navigateToDestination, "Explore"),
                  child: Text('Explore Destinations'),
                ),
              ),
              SizedBox(height: 20),
              // Plan a Trip Button
              AnimatedOpacity(
                opacity: _opacityPlan,
                duration: Duration(milliseconds: 150),
                child: ElevatedButton(
                  onPressed: () => _onButtonPress(_navigateToPlanTrip, "Plan"),
                  child: Text('Plan a Trip'),
                ),
              ),
              SizedBox(height: 20),
              // Packing List Button
              AnimatedOpacity(
                opacity: _opacityPacking,
                duration: Duration(milliseconds: 150),
                child: ElevatedButton(
                  onPressed: () => _onButtonPress(_navigateToPackingList, "Packing"),
                  child: Text('Packing List'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
