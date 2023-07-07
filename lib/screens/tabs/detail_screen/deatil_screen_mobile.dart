import 'package:arecanut_app/constants/dimensions.dart';
import 'package:arecanut_app/models/data_models/machine_service_model.dart';
import 'package:arecanut_app/models/data_models/service_provider_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../repository/auth_repository.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/show_message.dart';
import '../../components/footer/footer_mobile.dart';
import '../book_machine/book_machine_page_mobile.dart';

class DetailScreenMobile extends StatefulWidget {
  const DetailScreenMobile(
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
              Stack(children: [
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
                Positioned(
                    width: 40,
                    height: 40,
                    right: 8,
                    top: 8,
                    child: InkWell(
                      onTap: () async {
                        if (checkLoggedIn()) {
                          // if(isExists){
                          //   final item = _machines[index].toJson();
                          //   FavoritesManager.removeFromFavorites(item);
                          //   favoritesNotifier.notifyListeners();
                          // }
                          // else {
                          //   Map<String, dynamic> itemMap = _machines[index].toJson();
                          //   await FavoritesManager.saveToFavorites(itemMap);
                          //   favoritesNotifier.notifyListeners();
                          // }
                        } else {
                          showToast("You are not logged in");
                        }
                        //   Map<String, dynamic> itemMap = _machines[index].toJson();
                        //   await FavoritesManager.saveToFavorites(itemMap);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.fifty),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 3)
                              ]),
                          // child: isExists ? Icon(Icons.favorite,color: Colors.red,size: Dimensions.thirty,) : Icon(Icons.favorite_outline,color: Colors.red,size: Dimensions.thirty,)
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            // size: 30,
                          )),
                    )),
              ]),
              const SizedBox(height: 10),
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
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedImage =
                                widget.machineService.galleryImages[index];
                          });
                        },
                        child: Stack(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(color: Colors.white, width: 5)),
                            width: 80,
                            height: 100,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/image_placeholder.png"),
                                    fit: BoxFit.cover)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  widget.machineService.galleryImages[index],
                              fit: BoxFit.cover,
                            ),
                            // child: Image.network(
                            //   widget.machineService.galleryImages[index],
                            //   fit: BoxFit.cover,
                            // ),
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
                        const Text(
                          "Price :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Rs ₹ $formattedPrice /-",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
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
                        const Text(
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
                            if (kDebugMode) {
                              print(rating);
                            }
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "${4.0} ratings",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
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
                    const Text(
                      "Status:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
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
                    decoration: const BoxDecoration(
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
                    child: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mr. ${widget.serviceProviderModel.serviceProviderName}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.serviceProviderModel.serviceProviderAddress,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              // Divider(),
              customDivider(color),
              const Text(
                "Details:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
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
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      title: "Book Now",
                      onPressed: () {
                        if (checkLoggedIn()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookMachineMobile(
                                        title:
                                            widget.machineService.machineName,
                                        image: widget
                                            .machineService.galleryImages[0],
                                        price: widget.machineService.price
                                            .toString(),
                                        rating: '4.3',
                                        distance: "10",
                                        totalRatings: widget
                                            .serviceProviderModel.totalRatings
                                            .toString(),
                                        address: widget.serviceProviderModel
                                            .serviceProviderAddress,
                                        machineId: widget.machineId,
                                        serviceProviderId:
                                            widget.serviceProviderId,
                                      )));
                        } else {
                          showToast("You are not logged in");
                        }
                      },
                      fontSize: 20,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              const Footer()
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
                style: const TextStyle(fontSize: 18),
              )),
          const Text(":"),
          const SizedBox(
            width: 10,
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18),
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
