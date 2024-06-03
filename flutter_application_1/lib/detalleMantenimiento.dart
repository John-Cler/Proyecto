import 'package:flutter/material.dart';

//MaintenanceDetailsScreen
class DetalleMantenimiento extends StatelessWidget {
  static String ROUTE = "/detalleMantenimiento";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance Details'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Maintenance Date: Date Details',
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Description: Description Details'),
            SizedBox(height: 10),
            Text('Status: Status Details'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add/edit maintenance screen
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
