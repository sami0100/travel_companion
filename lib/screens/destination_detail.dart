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
        imageUrl = 'https://img.travelnaut.com/web/db/photose/location/eu/gb/en/london/e85c83b8c4ffc98f549d043572af72d9.jpeg?format=webp&width=3840&quality=75';
        description = 'The capital of England, known for its history and architecture.';
        break;
      case 'Sydney':
        imageUrl = 'https://cdn-imgix.headout.com/tour/20072/TOUR-IMAGE/d85280d5-3c4f-4f54-bd7a-6fc5cc68597f-10732-sydney-sydney-and-bondi-tour-with-sydney-opera-house-tour-01.jpg';
        description = 'Famous for the Sydney Opera House and stunning harbor views.';
        break;
      case 'Dubai':
        imageUrl = 'https://media.tacdn.com/media/attractions-splice-spp-674x446/09/1f/b0/b1.jpg';
        description = 'A global city known for luxury shopping, ultramodern architecture, and nightlife.';
        break;
      case 'Rome':
        imageUrl = 'https://thumbs.dreamstime.com/b/rome-italy-22120319.jpg';
        description = 'The Eternal City, rich in history, culture, and monumental architecture.';
        break;
      case 'Barcelona':
        imageUrl = 'https://img1.10bestmedia.com/Images/Photos/378847/GettyImages-1085317916_55_660x440.jpg';
        description = 'A vibrant city famous for its art, architecture, and lively culture.';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
            imageUrl.isNotEmpty
                ? Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Center(
              child: Text(
                'Image not available',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_city, color: Colors.blue, size: 30),
                SizedBox(width: 10),
                Text(
                  'Discover more about $destination!',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
