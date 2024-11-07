import 'package:flutter/material.dart';

class PlanTripScreen extends StatefulWidget {
  @override
  _PlanTripScreenState createState() => _PlanTripScreenState();
}

class _PlanTripScreenState extends State<PlanTripScreen> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final List<String> _activities = [];

  // Variable to hold trip details
  String _tripDetails = '';

  void _addActivity(String activity) {
    if (activity.isNotEmpty) {
      setState(() {
        _activities.add(activity);
      });
    }
  }

  void _saveTrip() {
    String destination = _destinationController.text;
    String startDate = _startDateController.text;
    String endDate = _endDateController.text;

    // Prepare trip details for display
    setState(() {
      _tripDetails = 'Destination: $destination\n'
          'Start Date: $startDate\n'
          'End Date: $endDate\n'
          'Activities: ${_activities.join(', ')}';
    });

    // Clear the fields after saving
    _destinationController.clear();
    _startDateController.clear();
    _endDateController.clear();
    setState(() {
      _activities.clear(); // Clear activities after saving
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan a Trip'),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Destination',
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'Start Date (YYYY-MM-DD)',
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'End Date (YYYY-MM-DD)',
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Activities:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: _activities.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        _activities[index],
                        style: TextStyle(color: Colors.blue.shade900),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Add Activity'),
              onSubmitted: _addActivity,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _saveTrip, // Call _saveTrip on button press
              child: Text('Save Trip'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12, // Updated button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Trip Details:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(_tripDetails), // Display the saved trip details here
          ],
        ),
      ),
    );
  }
}
