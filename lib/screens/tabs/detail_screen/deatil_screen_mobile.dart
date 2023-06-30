import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_button.dart';

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
  String selectedImage = "";

  @override
  void initState() {
    super.initState();
    selectedImage = widget.machineService.galleryImages[0];
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    var formatter = NumberFormat('#,###');
    var formattedPrice = formatter.format(widget.machineService.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.machineService.machineName),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack(
              //   alignment: Alignment.bottomCenter,
              //   children: [
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: CarouselSlider(
              //     items: widget.machineService.galleryImages.map((imagePath) {
              //       return Container(
              //         margin: EdgeInsets.symmetric(horizontal: 10),
              //         width: double.maxFinite,
              //         height: 150,
              //         child: Image.network(
              //           imagePath,
              //           fit: BoxFit.cover,
              //         ),
              //       );
              //     }).toList(),
              //     options: CarouselOptions(
              //       height: 300,
              //       // autoPlay: true,
              //       // enlargeCenterPage: true,
              //       enableInfiniteScroll: true,
              //       autoPlayInterval: Duration(seconds: 3),
              //       viewportFraction: 0.9,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   height: 100,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: widget.machineService.galleryImages.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         margin: EdgeInsets.only(right: 10),
              //         width: 100,
              //         child: Image.network(
              //             widget.machineService.galleryImages[index]),
              //       );
              //     },
              //   ),
              // ),
              //   ],
              // )
              Container(
                width: double.maxFinite,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/image_placeholder.png"),
                        fit: BoxFit.cover)),
                child: CachedNetworkImage(
                  imageUrl: selectedImage,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.machineService.galleryImages.length >= 5
                        ? 5
                        : widget.machineService.galleryImages.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImage =
                                widget.machineService.galleryImages[index];
                          });
                        },
                        child: Stack(children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(color: Colors.white, width: 5)),
                            width: 80,
                            height: 100,
                            child: Image.network(
                              widget.machineService.galleryImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (selectedImage ==
                              widget.machineService.galleryImages[index])
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                            )
                        ]),
                      );
                    },
                  ),
                ),
              ),
              // Divider(),
              customDivider(color),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Price :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Rs ₹ $formattedPrice /-",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Distance :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "4 km Away",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "4.0",
                          style: TextStyle(fontSize: 15),
                        ),
                        RatingBar.builder(
                          initialRating: 4.0, // The rating value
                          minRating: 1, // Minimum rating value
                          direction: Axis
                              .horizontal, // The direction of the rating bar
                          allowHalfRating:
                              true, // Allow half ratings (e.g., 3.5 stars)
                          itemCount: 5, // Total number of stars
                          itemSize: 22, // Size of each star
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.orange, // Color of the filled star
                          ),
                          onRatingUpdate: (rating) {
                            // Callback function when the rating is updated
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${4.0} ratings",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.message),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "30",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "reviews",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "Status:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.machineService.status == true
                          ? "Available:"
                          : "Not Available",
                      style: TextStyle(
                          fontSize: 20,
                          color: widget.machineService.status == true
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
              ),
              // Divider(),
              customDivider(color),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      // image: DecorationImage(
                      //     image: AssetImage("")
                      // )
                    ),
                    width: 60,
                    height: 60,
                    // child: CachedNetworkImage(
                    //   imageUrl: "",
                    //   placeholder: (context, url) =>
                    //       Image.asset("assets/images/image_placeholder.png"),
                    // ),
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mr. ${widget.serviceProviderModel.serviceProviderName}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.serviceProviderModel.serviceProviderAddress,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              // Divider(),
              customDivider(color),
              Text(
                "Details:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  textWithNameAndValue("Location",
                      widget.serviceProviderModel.serviceProviderAddress),
                  textWithNameAndValue(
                      "Capacity", widget.machineService.machineCapacity),
                  textWithNameAndValue("Workers",
                      "${widget.serviceProviderModel.workers} members"),
                  textWithNameAndValue("Experience",
                      "${widget.serviceProviderModel.experience} years"),
                  textWithNameAndValue("Total Machines ",
                      widget.serviceProviderModel.totalMachines),
                ],
              ),
              // Divider(),
              customDivider(color),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: CustomOutlineButton(
                      title: "Save to Later",
                      onPressed: () {},
                      fontSize: 20,
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      title: "Book Now",
                      onPressed: () {},
                      fontSize: 20,
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  textWithNameAndValue(name, value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
              width: 150,
              child: Text(
                name,
                style: TextStyle(fontSize: 18),
              )),
          Text(":"),
          SizedBox(
            width: 10,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  customDivider(color) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Divider(
          color: color,
          thickness: 0.5,
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
