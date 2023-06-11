import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:arecanut_app/screens/detail_screen/deatil_screen_mobile.dart';
import 'package:arecanut_app/screens/detail_screen/detail_screen_desktop.dart';
import 'package:arecanut_app/screens/detail_screen/detail_screen_tablet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      required this.machineService,
      required this.serviceProviderModel})
      : super(key: key);

  final MachineService machineService;
  final ServiceProviderModel serviceProviderModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => DetailScreenMobile(
          machineService: widget.machineService,
          serviceProviderModel: widget.serviceProviderModel),
      tablet: (_) => DetailScreenTablet(
          machineService: widget.machineService,
          serviceProviderModel: widget.serviceProviderModel),
      desktop: (_) => DetailScreenDesktop(
          machineService: widget.machineService,
          serviceProviderModel: widget.serviceProviderModel),
    );
  }
}
