
import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataService{

  final CollectionReference machineRef = FirebaseFirestore.instance.collection('machines');

  Future<void> getMachines() async {
    List machines = [];
    List providers = [];

    var serviceProviderId;

    final snapshot = await machineRef.get();

    for(QueryDocumentSnapshot queryDocumentSnapshot in snapshot.docs){
      final String id = queryDocumentSnapshot.id;

      final data = queryDocumentSnapshot.data() as Map<String, dynamic>;

      serviceProviderId = data['serviceProviderId'];

      MachineService machine = MachineService(
          id: id,
          serviceProviderId: data['serviceProviderId'],
          machineName: data['machineName'],
          machineCapacity: data['machineCapacity'],
          price: data['price'],
          galleryImages: data['galleryImages'],
          status: data['status']
      );

      machines.add(machine);

      final serviceProviderRef = FirebaseFirestore.instance.collection('users').doc(serviceProviderId);
      final snapshot = await serviceProviderRef.get();
      final serviceProviderData = snapshot.data() as Map<String, dynamic>;


      ServiceProviderModel serviceProviderModel = ServiceProviderModel(
          // id: id,
          serviceProviderId: serviceProviderData['serviceProviderId'],
          serviceProviderName: serviceProviderData['serviceProviderName'],
          serviceProviderAddress: serviceProviderData['serviceProviderAddress'],
          experience: serviceProviderData['experience'],
          totalMachines: serviceProviderData['totalMachines'],
          workers: serviceProviderData['workers'],
          overallRating: serviceProviderData['overallRating'],
          totalRatings: serviceProviderData['totalRatings']
      );

      machines.add(serviceProviderModel);

      print(machines);
    }

  }

}