import 'package:flutter/material.dart';

class PlanTripScreen extends StatefulWidget {
  @override
  _PlanTripScreenState createState() => _PlanTripScreenState();
}

class _PlanTripScreenState extends State<PlanTripScreen> {
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController activityController = TextEditingController();
  List<String> activities = [];
  bool isTripSaved = false;

  void _addActivity() {
    if (activityController.text.isNotEmpty) {
      setState(() {
        activities.add(activityController.text);
        activityController.clear();
      });
    }
  }

  void _saveTrip() {
    if (destinationController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      setState(() {
        isTripSaved = true;
      });

      // Optionally, show a confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Trip Saved'),
          content: Text(
              'Destination: ${destinationController.text}\nStart Date: ${startDateController.text}\nEnd Date: ${endDateController.text}\nActivities: ${activities.join(', ')}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight_takeoff),
            SizedBox(width: 8),
            Text('Plan a Trip'),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.blue.shade50,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: destinationController,
                        decoration: InputDecoration(
                          labelText: 'Destination',
                          prefixIcon: Icon(Icons.place, color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: startDateController,
                        decoration: InputDecoration(
                          labelText: 'Start Date (YYYY-MM-DD)',
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: endDateController,
                        decoration: InputDecoration(
                          labelText: 'End Date (YYYY-MM-DD)',
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Activities:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: activityController,
                              decoration: InputDecoration(
                                labelText: 'Add an activity',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle, color: Colors.blue),
                            onPressed: _addActivity,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 8.0,
                        children: activities
                            .map((activity) => Chip(
                          label: Text(activity),
                          deleteIcon: Icon(Icons.close),
                          onDeleted: () {
                            setState(() {
                              activities.remove(activity);
                            });
                          },
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveTrip,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Save Trip', style: TextStyle(fontSize: 18)),
                ),
              ),
              if (isTripSaved) ...[
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Trip Details:', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('Destination: ${destinationController.text}'),
                Text('Start Date: ${startDateController.text}'),
                Text('End Date: ${endDateController.text}'),
                Text('Activities: ${activities.join(', ')}'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
