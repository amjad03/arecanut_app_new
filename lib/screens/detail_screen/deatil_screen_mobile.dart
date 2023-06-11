import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:flutter/material.dart';

class DetailScreenMobile extends StatefulWidget {
  const DetailScreenMobile(
      {Key? key,
      required this.machineService,
      required this.serviceProviderModel})
      : super(key: key);

  final MachineService machineService;
  final ServiceProviderModel serviceProviderModel;

  @override
  State<DetailScreenMobile> createState() => _DetailScreenMobileState();
}

class _DetailScreenMobileState extends State<DetailScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
