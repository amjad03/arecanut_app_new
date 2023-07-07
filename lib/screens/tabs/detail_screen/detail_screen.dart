import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'deatil_screen_mobile.dart';
import 'detail_screen_desktop.dart';
import 'detail_screen_tablet.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
        required this.machineService,
        required this.serviceProviderModel,
        required this.machineId,
        required this.serviceProviderId})
      : super(key: key);

  final MachineService machineService;
  final ServiceProviderModel serviceProviderModel;
  final String machineId;
  final String serviceProviderId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => DetailScreenMobile(
        machineService: widget.machineService,
        serviceProviderModel: widget.serviceProviderModel,
        machineId: widget.machineId,
        serviceProviderId: widget.serviceProviderId,
      ),
      tablet: (_) => DetailScreenTablet(
          machineService: widget.machineService,
          serviceProviderModel: widget.serviceProviderModel
      ),
      desktop: (_) => DetailScreenDesktop(
          machineService: widget.machineService,
          serviceProviderModel: widget.serviceProviderModel
      ),
    );
  }
}
