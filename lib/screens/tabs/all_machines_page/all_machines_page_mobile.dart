import 'package:arecanut_app/screens/components/footer/footer_mobile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../constants/dimensions.dart';
import '../../../models/data_models/machine_service_model.dart';
import '../../../models/data_models/service_provider_model.dart';
import '../../../repository/auth_repository.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/show_message.dart';
import '../book_machine/book_machine_page_mobile.dart';
import '../detail_screen/detail_screen.dart';

class AllMachinesPageMobile extends StatefulWidget {
  const AllMachinesPageMobile({Key? key}) : super(key: key);

  @override
  State<AllMachinesPageMobile> createState() => _AllMachinesPageMobileState();
}

class _AllMachinesPageMobileState extends State<AllMachinesPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Machines"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.ten),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('machines')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  }

                  final machineDocs = snapshot.data!.docs;

                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: machineDocs.length,
                        // itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          final machineData =
                              machineDocs[index].data() as Map<String, dynamic>;
                          final availability = machineData['status'];

                          final machineId = machineDocs[index].id;
                          return InkWell(
                            onTap: () async {
                              print("clicked");
                              final serviceProviderId =
                                  machineData['serviceProviderId'];

                              DocumentSnapshot serviceProviderSnapshot =
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(serviceProviderId)
                                      .get();

                              MachineService machineService = MachineService(
                                  serviceProviderId:
                                      machineData['serviceProviderId'],
                                  machineName: machineData['machineName'],
                                  machineCapacity:
                                      machineData['machineCapacity'],
                                  price: machineData['price'],
                                  galleryImages: machineData['galleryImages'],
                                  status: machineData['status']);
                              // MachineService.fromJson(machineDocs[index]
                              //     .data() as Map<String, dynamic>);

                              ServiceProviderModel serviceProviderModel =
                                  ServiceProviderModel.fromJson(
                                      serviceProviderSnapshot.data()
                                          as Map<String, dynamic>);

                              goToDetailScreen(
                                  machineService,
                                  serviceProviderModel,
                                  machineId,
                                  serviceProviderId);
                            },
                            child: MachineCardMobile(
                              title: machineData['machineName'],
                              rating: 4.0,
                              totalRatings: 42,
                              price: machineData['price'],
                              serviceProviderName: "Some Name",
                              image: machineData['galleryImages'][0],
                              address: 'Kotekere hubli Road, Sirsi',
                              status: machineData['status'],
                              serviceProviderId:
                                  machineData['serviceProviderId'],
                              machineId: machineId,
                            ),
                          );
                          // return ListTile(
                          //   title: Text('Machine ${index + 1}'),
                          //   subtitle: Text('Availability: $availability'),
                          // );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(top: Dimensions.ten),
                        width: double.maxFinite,
                        child: CustomButton(
                          title: "View All",
                          onPressed: () {},
                          fontSize: Dimensions.fifteen,
                        ),
                      ),
                    ],
                  );
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: machineDocs.length,
                  //   // itemCount: 2,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     final machineData =
                  //         machineDocs[index].data() as Map<String, dynamic>;
                  //     final availability = machineData['status'];
                  //
                  //     return InkWell(
                  //       onTap: () async {
                  //         print("clicked");
                  //         final serviceProviderId =
                  //             machineData['serviceProviderId'];
                  //
                  //         DocumentSnapshot serviceProviderSnapshot =
                  //             await FirebaseFirestore.instance
                  //                 .collection('users')
                  //                 .doc(serviceProviderId)
                  //                 .get();
                  //
                  //         MachineService machineService = MachineService(
                  //             serviceProviderId: machineData['serviceProviderId'],
                  //             machineName: machineData['machineName'],
                  //             machineCapacity: machineData['machineCapacity'],
                  //             price: machineData['price'],
                  //             galleryImages: machineData['galleryImages'],
                  //             status: machineData['status']);
                  //         // MachineService.fromJson(machineDocs[index]
                  //         //     .data() as Map<String, dynamic>);
                  //
                  //         ServiceProviderModel serviceProviderModel =
                  //             ServiceProviderModel.fromJson(
                  //                 serviceProviderSnapshot.data()
                  //                     as Map<String, dynamic>);
                  //
                  //         goToDetailScreen(machineService, serviceProviderModel);
                  //       },
                  //       child: MachineCardMobile(
                  //         title: machineData['machineName'],
                  //         rating: 4.0,
                  //         totalRatings: 42,
                  //         price: machineData['price'],
                  //         serviceProviderName: "Some Name",
                  //         image: machineData['galleryImages'][0],
                  //         address: 'Kotekere hubli Road, Sirsi',
                  //       ),
                  //     );
                  //     // return ListTile(
                  //     //   title: Text('Machine ${index + 1}'),
                  //     //   subtitle: Text('Availability: $availability'),
                  //     // );
                  //   },
                  // );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  void goToDetailScreen(MachineService machineService,
      ServiceProviderModel serviceProviderModel, machineId, serviceProviderId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailScreen(
                  machineService: machineService,
                  serviceProviderModel: serviceProviderModel,
                  machineId: machineId,
                  serviceProviderId: serviceProviderId,
                )));
  }
}

class MachineCardMobile extends StatefulWidget {
  const MachineCardMobile({
    super.key,
    required this.title,
    required this.rating,
    required this.totalRatings,
    required this.price,
    required this.serviceProviderName,
    required this.image,
    required this.address,
    required this.status,
    required this.serviceProviderId,
    required this.machineId,
  });

  final String title;
  final double rating;
  final int totalRatings;
  final double price;
  final bool status;
  final String address;
  final String serviceProviderName;
  final String serviceProviderId;
  final String machineId;
  final String image;

  @override
  State<MachineCardMobile> createState() => _MachineCardMobileState();
}

class _MachineCardMobileState extends State<MachineCardMobile> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade800
        : Colors.white;

    var bgColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade800
        : Colors.grey.shade300;

    var border = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black38;

    var formatter = NumberFormat('#,###');
    var formattedPrice = formatter.format(widget.price);

    return Padding(
      padding: EdgeInsets.only(top: Dimensions.ten),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.ten),
            color: color,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: Dimensions.five)
            ]),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.ten),
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.ten),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.five),
                    child: Container(
                        height: 210,
                        width: 120,
                        color: Colors.grey,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: Dimensions.ten,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 2),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.rating.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                            // SizedBox(width: 10,),
                            // Row(
                            //   children: [
                            //     Icon(Icons.star,color: Colors.orange,size: 15,),
                            //     Icon(Icons.star,color: Colors.orange,size: 15,),
                            //     Icon(Icons.star,color: Colors.orange,size: 15,),
                            //     Icon(Icons.star,color: Colors.orange,size: 15,),
                            //     Icon(Icons.star,color: Colors.orange,size: 15,),
                            //   ],
                            // ),
                            RatingBar.builder(
                              initialRating: widget.rating, // The rating value
                              minRating: 1, // Minimum rating value
                              direction: Axis
                                  .horizontal, // The direction of the rating bar
                              allowHalfRating:
                                  true, // Allow half ratings (e.g., 3.5 stars)
                              itemCount: 5, // Total number of stars
                              itemSize: 15, // Size of each star
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color:
                                    Colors.orange, // Color of the filled star
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
                              "${widget.totalRatings} ratings",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.address,
                              style: const TextStyle(fontSize: 14, height: 1.5),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "4 ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "km away",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs : ₹ $formattedPrice /-",
                              style: const TextStyle(fontSize: 18, height: 1.5),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.status == true
                                      ? "Available"
                                      : "Unavailable",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: widget.status == true
                                          ? Colors.green
                                          : Colors.red),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: bgColor,
                                  border: Border.all(color: border, width: 1),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.hundred)),
                              // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.ten,
                            ),
                            Expanded(
                              child: Text(
                                "Mr. ${widget.serviceProviderName}",
                                style: const TextStyle(fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              //   ],
                              // ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.ten,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomOutlineButton(
                              title: "Save to Later",
                              onPressed: () {},
                              fontSize: 12.0,
                            )),
                            SizedBox(
                              width: Dimensions.ten,
                            ),
                            Expanded(
                                child: CustomButton(
                              title: "Book Now",
                              onPressed: () {
                                if (checkLoggedIn()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookMachineMobile(
                                                title: widget.title,
                                                image: widget.image,
                                                price: widget.price.toString(),
                                                rating:
                                                    widget.rating.toString(),
                                                distance: "10",
                                                totalRatings: widget
                                                    .totalRatings
                                                    .toString(),
                                                address: widget.address,
                                                machineId: widget.machineId,
                                                serviceProviderId:
                                                    widget.serviceProviderId,
                                              )));
                                } else {
                                  showToast("You are not logged in");
                                }
                              },
                              fontSize: 12.0,
                            ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                width: 40,
                height: 40,
                right: 0,
                top: 0,
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
                          borderRadius: BorderRadius.circular(Dimensions.fifty),
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
        ),
      ),
    );
  }
}
