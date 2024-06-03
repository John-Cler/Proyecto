import 'package:flutter/material.dart';

//MaintenanceDetailsScreen
class DetalleMantenimiento extends StatelessWidget {
  static String ROUTE = "/detalleMantenimiento";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de Mantenimiento'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha de Mantenimiento: Detalle',
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Descripcion: Detalle Descripcion '),
            SizedBox(height: 10),
            Text('Estado: En mantenimiento'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const Text("Editar ");
          // Navigate to add/edit maintenance screen
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
