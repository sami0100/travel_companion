import 'package:flutter/material.dart';
import 'screens/destination_explorer.dart';
import 'screens/packing_list.dart';
import 'screens/plan_trip.dart';

import 'screens/grid_view_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _opacityExplore = 1.0;
  double _opacityPlan = 1.0;
  double _opacityPacking = 1.0;

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

  void _navigateToDestination() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DestinationExplorerScreen()));
  }

  void _navigateToPlanTrip() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PlanTripScreen()));
  }

  void _navigateToPackingList() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PackingListScreen()));
  }

  void _onChipTap(String category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You tapped on $category'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700, // Ensure a background color that contrasts with the icon
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Adjust size to fit content
            children: [
              Icon(Icons.flight_takeoff, color: Colors.white), // White color for better contrast
              SizedBox(width: 10),
              Text(
                'Travel Companion',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Ensure the text is also visible
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 2,
        ),


        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade300, Colors.blue.shade900],
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Welcome to Travel Companion!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/e/e6/Paris_Night.jpg'),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDw-z7Wa2VNfGGQT6sK3JGQGIgZWPKyBZ65g&s'),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?q=80&w=1494&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://cdn-imgix.headout.com/tour/20072/TOUR-IMAGE/d85280d5-3c4f-4f54-bd7a-6fc5cc68597f-10732-sydney-sydney-and-bondi-tour-with-sydney-opera-house-tour-01.jpg'),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://media.tacdn.com/media/attractions-splice-spp-674x446/09/1f/b0/b1.jpg'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/grid'),
                          child: Text('Grid View Destinations'),
                        ),
                        ElevatedButton(
                          onPressed: () => _onButtonPress(_navigateToDestination, "Explore"),
                          child: Text('Explore Destinations'),
                        ),
                        ElevatedButton(
                          onPressed: () => _onButtonPress(_navigateToPlanTrip, "Plan"),
                          child: Text('Plan a Trip'),
                        ),
                        ElevatedButton(
                          onPressed: () => _onButtonPress(_navigateToPackingList, "Packing"),
                          child: Text('Packing List'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.flight, color: Colors.white, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'Plan your dream trip!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      GestureDetector(
                        onTap: () => _onChipTap('Adventure'),
                        child: Chip(
                          label: Text('Adventure'),
                          backgroundColor: Colors.orange.shade100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onChipTap('Culture'),
                        child: Chip(
                          label: Text('Culture'),
                          backgroundColor: Colors.orange.shade100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onChipTap('Relaxation'),
                        child: Chip(
                          label: Text('Relaxation'),
                          backgroundColor: Colors.orange.shade100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onChipTap('Sightseeing'),
                        child: Chip(
                          label: Text('Sightseeing'),
                          backgroundColor: Colors.orange.shade100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
