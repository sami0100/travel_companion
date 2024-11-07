import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {'name': 'Paris', 'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Paris_Night.jpg'},
    {'name': 'New York', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDw-z7Wa2VNfGGQT6sK3JGQGIgZWPKyBZ65g&s'},
    {'name': 'Tokyo', 'image': 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?q=80&w=1494&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    {'name': 'London', 'image': 'https://img.travelnaut.com/web/db/photose/location/eu/gb/en/london/e85c83b8c4ffc98f549d043572af72d9.jpeg?format=webp&width=3840&quality=75'},
    {'name': 'Sydney', 'image': 'https://cdn-imgix.headout.com/tour/20072/TOUR-IMAGE/d85280d5-3c4f-4f54-bd7a-6fc5cc68597f-10732-sydney-sydney-and-bondi-tour-with-sydney-opera-house-tour-01.jpg'},
    {'name': 'Dubai', 'image': 'https://media.tacdn.com/media/attractions-splice-spp-674x446/09/1f/b0/b1.jpg'},
    {'name': 'Rome', 'image': 'https://thumbs.dreamstime.com/b/rome-italy-22120319.jpg'},
    {'name': 'Barcelona', 'image': 'https://img1.10bestmedia.com/Images/Photos/378847/GettyImages-1085317916_55_660x440.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Destinations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Display 2 images per row
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 4 / 3, // Adjust aspect ratio for better fit
          ),
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      destinations[index]['image']!,
                      fit: BoxFit.cover, // Ensures the image covers the space proportionally
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      destinations[index]['name']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
