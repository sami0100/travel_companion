import 'package:flutter/material.dart';

class PackingListScreen extends StatefulWidget {
  @override
  _PackingListScreenState createState() => _PackingListScreenState();
}

class _PackingListScreenState extends State<PackingListScreen> {
  final TextEditingController itemController = TextEditingController();
  List<String> packingItems = [];

  void _addItem() {
    if (itemController.text.isNotEmpty) {
      setState(() {
        packingItems.add(itemController.text);
        itemController.clear();
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      packingItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.backpack),
            SizedBox(width: 8),
            Text('Packing List'),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue.shade50,
        padding: EdgeInsets.all(16.0),
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: itemController,
                        decoration: InputDecoration(
                          labelText: 'Add Packing Item',
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
                      onPressed: _addItem,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: packingItems.isEmpty
                  ? Center(
                child: Text(
                  'No items added yet.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: packingItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(packingItems[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
