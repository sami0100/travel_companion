import 'package:flutter/material.dart';

class PackingListScreen extends StatefulWidget {
  @override
  _PackingListScreenState createState() => _PackingListScreenState();
}

class _PackingListScreenState extends State<PackingListScreen> {
  final List<String> _packingList = []; // List to hold packing items
  final TextEditingController _controller = TextEditingController(); // Controller for the text field

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _packingList.add(_controller.text); // Add item to the list
        _controller.clear(); // Clear the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packing List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add Packing Item',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addItem, // Call _addItem on button press
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _packingList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_packingList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
