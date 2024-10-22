import 'package:flutter/material.dart';

class DestinationDetailScreen extends StatelessWidget {
  final String destination;

  DestinationDetailScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    String description;

    // Assign image URL and description based on the selected destination
    switch (destination) {
      case 'Paris':
        imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Paris_Night.jpg';
        description = 'The City of Light, known for its art, fashion, and culture.';
        break;
      case 'New York':
        imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDw-z7Wa2VNfGGQT6sK3JGQGIgZWPKyBZ65g&s';
        description = 'The Big Apple, famous for its skyline and vibrant city life.';
        break;
      case 'Tokyo':
        imageUrl = 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?q=80&w=1494&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
        description = 'A bustling metropolis blending the ultramodern with traditional culture.';
        break;
      case 'London':
        imageUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/London_Skyline_%28125508655%29.jpeg/1024px-London_Skyline_%28125508655%29.jpeg';
        description = 'The capital of England, known for its history and architecture.';
        break;
      default:
        imageUrl = '';
        description = 'Details not available.';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(destination),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Return to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
