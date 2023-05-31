class ServiceProviderModel{

  ServiceProviderModel({
    // required this.id,
    required this.serviceProviderId,
    required this.serviceProviderName,
    required this.serviceProviderAddress,
    required this.experience,
    required this.totalMachines,
    required this.workers,
    required this.overallRating,
    required this.totalRatings
  });

  // final String id;
  final String serviceProviderId;
  final String serviceProviderName;
  final String serviceProviderAddress;
  final String experience;
  final String totalMachines;
  final String workers;
  final double overallRating;
  final int totalRatings;

  factory ServiceProviderModel.fromJson(Map<String, dynamic> json){
    return ServiceProviderModel(
        // id: json['id'],
        serviceProviderId: json['serviceProviderId'],
        serviceProviderName: json['serviceProviderName'],
        serviceProviderAddress: json['serviceProviderAddress'],
        experience: json['experience'],
        totalMachines: json['totalMachines'],
        workers: json['workers'],
        overallRating: json['overallRating'],
        totalRatings: json['totalRatings']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      // 'id': id,
      'serviceProviderId': serviceProviderId,
      'serviceProviderName': serviceProviderName,
      'serviceProviderAddress': serviceProviderAddress,
      'experience': experience,
      'totalMachines': totalMachines,
      'workers': workers,
      'overallRating': overallRating,
      'totalRatings': totalRatings
    };
  }

}