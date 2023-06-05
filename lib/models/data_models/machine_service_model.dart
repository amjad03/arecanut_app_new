class MachineService {
  MachineService(
      {required this.id,
      required this.serviceProviderId,
      required this.machineName,
      required this.machineCapacity,
      required this.price,
      required this.galleryImages,
      required this.status});

  final String id;
  final String serviceProviderId;
  final String machineName;
  final String machineCapacity;
  final String price;
  final List galleryImages;
  final bool status;

  factory MachineService.fromJson(Map<String, dynamic> json) {
    return MachineService(
        id: json['id'],
        serviceProviderId: json['serviceProviderId'],
        machineName: json['machineName'],
        machineCapacity: json['machineCapacity'],
        price: json['price'],
        galleryImages: List<String>.from(json['galleryImages']),
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceProviderId': serviceProviderId,
      'machineName': machineName,
      'machineCapacity': machineCapacity,
      'price': price,
      'galleryImages': galleryImages,
      'status': status
    };
  }
}

// final String id;
// final String serviceProviderId;
// final String machineName;
// // final String serviceProviderName;
// // final String serviceProviderAddress;
// // final String experience;
// // final String totalMachines;
// // final String workers;
// final String machineCapacity;
// final String price;
// // final double overallRating;
// // final int totalRatings;
// final List galleryImages;
// final bool status;
