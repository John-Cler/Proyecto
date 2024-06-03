import 'package:flutter/material.dart';
import 'package:flutter_application_1/detalleMantenimiento.dart';

class ListaMantenimiento extends StatelessWidget {
  static String ROUTE = "/listaMantenimiento";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance List'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with dynamic item count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Maintenance $index'),
            subtitle: Text('Status $index'),
            onTap: () {
              // Navigator.pushNamed(context, DetalleMantenimiento.ROUTE);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add/edit maintenance screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
