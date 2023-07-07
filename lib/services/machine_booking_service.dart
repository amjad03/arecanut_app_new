import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void bookMachine(name, email, phone, address, occupation, machineId,
    serviceProviderId, date, qty, arecanutType) async {
  // final user = FirebaseAuth.instance.currentUser;
  // final userId = user?.uid;

  final machineBookingsCollectionRef =
      FirebaseFirestore.instance.collection('machineBookings');

  final machineBookingData = {
    'name': name,
    'email': email,
    'phone': phone,
    'address': address,
    'occupation': occupation,
    'machineId': machineId,
    'serviceProviderId': serviceProviderId,
    'date': date,
    'qty': qty,
    'arecanutType': arecanutType,
  };

  // await machineBookingsCollectionRef.;
  await machineBookingsCollectionRef.add(machineBookingData);
}
