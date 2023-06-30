import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:flutter/material.dart';

class DetailScreenDesktop extends StatefulWidget {
  const DetailScreenDesktop(
      {Key? key,
      required this.machineService,
      required this.serviceProviderModel})
      : super(key: key);

  final MachineService machineService;
  final ServiceProviderModel serviceProviderModel;

  @override
  State<DetailScreenDesktop> createState() => _DetailScreenDesktopState();
}

class _DetailScreenDesktopState extends State<DetailScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
