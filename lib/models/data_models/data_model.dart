// class DataModel {
//   final String id;
//   final String serviceProviderId;
//   final String machineName;
//   final String machineCapacity;
//   final String price;
//   final List galleryImages;
//   final bool status;
//   // final String serviceProviderId;
//   final String serviceProviderName;
//   final String serviceProviderAddress;
//   final String experience;
//   final String totalMachines;
//   final String workers;
//   final double overallRating;
//   final int totalRatings;
//
//   DataModel(
//       {required this.id,
//       required this.serviceProviderId,
//       required this.machineName,
//       required this.machineCapacity,
//       required this.price,
//       required this.galleryImages,
//       required this.status,
//       required this.serviceProviderName,
//       required this.serviceProviderAddress,
//       required this.experience,
//       required this.totalMachines,
//       required this.workers,
//       required this.overallRating,
//       required this.totalRatings});
// }

import 'package:arecanut_app/models/data_models/service_provider_model.dart';

import 'machine_service_model.dart';

class CombinedModel {
  final MachineService machineService;
  final ServiceProviderModel serviceProviderModel;

  CombinedModel({
    required this.machineService,
    required this.serviceProviderModel,
  });

  factory CombinedModel.fromJson(Map<String, dynamic> json) {
    return CombinedModel(
      machineService: MachineService.fromJson(json['machineService']),
      serviceProviderModel:
          ServiceProviderModel.fromJson(json['serviceProviderModel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'machineService': machineService.toJson(),
      'serviceProviderModel': serviceProviderModel.toJson(),
    };
  }
}
