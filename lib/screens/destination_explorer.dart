import 'package:flutter/material.dart';
import 'destination_detail.dart'; // Import the Destination Detail screen

class DestinationExplorerScreen extends StatelessWidget {
  final List<String> destinations = [
    'Paris',
    'New York',
    'Tokyo',
    'London',
    'Sydney',
    'Dubai',
    'Rome',
    'Barcelona',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Destinations'),
        elevation: 2, // Elevation to give shadow effect
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10.0), // Spacing between items
              elevation: 5, // Elevation for shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              child: ListTile(
                tileColor: Colors.blue.shade50, // Light blue background for each tile
                title: Text(
                  destinations[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600, // Make text bold
                    color: Colors.blue.shade900, // Dark blue text color
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade900), // Dark blue icon
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DestinationDetailScreen(destination: destinations[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
