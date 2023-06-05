import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MachineStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Machine Status'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('machines').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          final machineDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: machineDocs.length,
            itemBuilder: (BuildContext context, int index) {
              final machineData =
                  machineDocs[index].data() as Map<String, dynamic>;
              final availability = machineData['status'];

              return ListTile(
                title: Text('Machine ${index + 1}'),
                subtitle: Text('Availability: $availability'),
              );
            },
          );
        },
      ),
    );
  }
}
