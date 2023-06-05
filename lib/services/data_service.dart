import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/data_models/data_model.dart';

class DataService {
  final CollectionReference machineRef =
      FirebaseFirestore.instance.collection('machines');

  // Future<void> getMachines() async {
  //   List machines = [];
  //   List providers = [];
  //
  //   var serviceProviderId;
  //
  //   final snapshot = await machineRef.get();
  //
  //   for(QueryDocumentSnapshot queryDocumentSnapshot in snapshot.docs){
  //     final String id = queryDocumentSnapshot.id;
  //
  //     final data = queryDocumentSnapshot.data() as Map<String, dynamic>;
  //
  //     serviceProviderId = data['serviceProviderId'];
  //
  //     MachineService machine = MachineService(
  //         id: id,
  //         serviceProviderId: data['serviceProviderId'],
  //         machineName: data['machineName'],
  //         machineCapacity: data['machineCapacity'],
  //         price: data['price'],
  //         galleryImages: data['galleryImages'],
  //         status: data['status']
  //     );
  //
  //     machines.add(machine);
  //
  //     final serviceProviderRef = FirebaseFirestore.instance.collection('users').doc(serviceProviderId);
  //     final snapshot = await serviceProviderRef.get();
  //     final serviceProviderData = snapshot.data() as Map<String, dynamic>;
  //
  //
  //     ServiceProviderModel serviceProviderModel = ServiceProviderModel(
  //         // id: id,
  //         serviceProviderId: serviceProviderData['serviceProviderId'],
  //         serviceProviderName: serviceProviderData['serviceProviderName'],
  //         serviceProviderAddress: serviceProviderData['serviceProviderAddress'],
  //         experience: serviceProviderData['experience'],
  //         totalMachines: serviceProviderData['totalMachines'],
  //         workers: serviceProviderData['workers'],
  //         overallRating: serviceProviderData['overallRating'],
  //         totalRatings: serviceProviderData['totalRatings']
  //     );
  //
  //     machines.add(serviceProviderModel);
  //
  //     print(machines);
  //   }
  //
  // }

  Future<List<CombinedModel>> getMachines() async {
    List<CombinedModel> combinedData = [];

    // Retrieve data from machines collection
    QuerySnapshot machinesSnapshot =
        await FirebaseFirestore.instance.collection('machines').get();

    for (QueryDocumentSnapshot machineDoc in machinesSnapshot.docs) {
      // Get the serviceProviderId from the machine document
      final data = machineDoc.data() as Map<String, dynamic>;
      String serviceProviderId = data['serviceProviderId'];

      // Retrieve the corresponding service provider details
      DocumentSnapshot serviceProviderSnapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(serviceProviderId)
          .get();
      // .instance
      // .collection('service providers')
      // .doc(serviceProviderId)
      // .get();

      // Create MachineService and ServiceProviderModel objects
      MachineService machineService =
          MachineService.fromJson(machineDoc.data() as Map<String, dynamic>);

      ServiceProviderModel serviceProviderModel = ServiceProviderModel.fromJson(
          serviceProviderSnapshot.data() as Map<String, dynamic>);

      // Create a CombinedModel object
      CombinedModel combinedModel = CombinedModel(
        machineService: machineService,
        serviceProviderModel: serviceProviderModel,
      );

      // Add the CombinedModel to the list
      combinedData.add(combinedModel);
    }

    return combinedData;
  }
}
