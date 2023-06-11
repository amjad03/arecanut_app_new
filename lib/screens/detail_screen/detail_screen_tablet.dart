import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:flutter/material.dart';

class DetailScreenTablet extends StatefulWidget {
  const DetailScreenTablet(
      {Key? key,
      required this.machineService,
      required this.serviceProviderModel})
      : super(key: key);

  final MachineService machineService;
  final ServiceProviderModel serviceProviderModel;

  @override
  State<DetailScreenTablet> createState() => _DetailScreenTabletState();
}

class _DetailScreenTabletState extends State<DetailScreenTablet> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
