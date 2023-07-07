import 'package:arecanut_app/constants/constants.dart';
import 'package:arecanut_app/screens/tabs/all_machines_page/all_machines_page_mobile.dart';
import 'package:arecanut_app/screens/tabs/book_machine/book_machine_page_mobile.dart';
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
import '../../components/carousel/carousel_page.dart';
import '../../components/drawers/navigation_drawer.dart';
import '../../components/footer/footer_mobile.dart';
import '../../components/graph/line_graph.dart';
import '../../profile/profile.dart';
import '../../search_page.dart';
import '../detail_screen/detail_screen.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppInfo.appName,
          style: TextStyle(
              fontSize: Dimensions.twenty, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(
                Icons.search,
              )),
          // Chip(
          //   backgroundColor: Colors.white,
          //   avatar: Icon(Icons.language,color: iconColor,),
          //   label: Text(""),
          //   labelPadding: EdgeInsets.zero,
          // ),
          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(
                Icons.language,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(length: 0)));
              },
              icon: Icon(
                Icons.account_circle,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.ten),
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: Dimensions.ten),
              //   child: Container(
              //     color: Colors.grey.shade300,
              //     width: double.maxFinite,
              //     height: 180,
              //   ),
              // ),
              const CustomBannerSliderMobile(),
              SizedBox(
                height: Dimensions.ten,
              ),
              Text(
                "Top Rated",
                style: TextStyle(fontSize: Dimensions.twenty),
              ),
              Divider(
                color: Colors.black54,
                indent: Dimensions.forty,
                endIndent: Dimensions.forty,
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: Dimensions.ten),
              //   child: Container(
              //     width: double.maxFinite,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(Dimensions.ten),
              //         color: Colors.white,
              //         boxShadow: [
              //           BoxShadow(
              //               color: Colors.black26,
              //               blurRadius: Dimensions.five
              //           )
              //         ]
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.all(Dimensions.ten),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(Dimensions.ten),
              //         child: Row(
              //           children: [
              //             ClipRRect(
              //               borderRadius: BorderRadius.circular(Dimensions.five),
              //               child: Container(
              //                 height: 180,
              //                 width: 120,
              //                 color: Colors.grey,
              //                 child: Image.network("https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",fit: BoxFit.cover,)
              //               ),
              //             ),
              //             SizedBox(width: Dimensions.ten,),
              //             Expanded(
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //                   Row(
              //                     children: [
              //                       Text("4.5",style: TextStyle(fontSize: 14),),
              //                       // SizedBox(width: 10,),
              //                       // Row(
              //                       //   children: [
              //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
              //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
              //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
              //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
              //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
              //                       //   ],
              //                       // ),
              //                       RatingBar.builder(
              //                         initialRating: 4.5, // The rating value
              //                         minRating: 1, // Minimum rating value
              //                         direction: Axis.horizontal, // The direction of the rating bar
              //                         allowHalfRating: true, // Allow half ratings (e.g., 3.5 stars)
              //                         itemCount: 5, // Total number of stars
              //                         itemSize: 15, // Size of each star
              //                         itemBuilder: (context, _) => const Icon(
              //                           Icons.star,
              //                           color: Colors.orange, // Color of the filled star
              //                         ),
              //                         onRatingUpdate: (rating) {
              //                           // Callback function when the rating is updated
              //                           print(rating);
              //                         },
              //                       ),
              //                       SizedBox(width: 15,),
              //                       Text("32 ratings",style: TextStyle(fontSize: 12),),
              //                     ],
              //                   ),
              //                   Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //                   Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //                   Divider(),
              //                   Row(
              //                     children: [
              //                       Container(
              //                         height: 40,
              //                         width: 40,
              //                         decoration: BoxDecoration(
              //                             color: Colors.grey.shade300,
              //                             border: Border.all(color: Colors.black38, width: 1),
              //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
              //                         ),
              //                         // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
              //                         child: Icon(Icons.person,),
              //                       ),
              //                       SizedBox(width: Dimensions.ten,),
              //                       Expanded(
              //                         child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //                         // child: Column(
              //                         //   mainAxisAlignment: MainAxisAlignment.start,
              //                         //   crossAxisAlignment: CrossAxisAlignment.start,
              //                         //   children: [
              //                         //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //                         //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //                         //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
              //                         //   ],
              //                         // ),
              //                       )
              //                     ],
              //                   ),
              //                   SizedBox(height: Dimensions.ten,),
              //                   Row(
              //                     children: [
              //                       Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
              //                       SizedBox(width: Dimensions.ten,),
              //                       Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

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
                        itemCount:
                            machineDocs.length > 2 ? 2 : machineDocs.length,
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AllMachinesPageMobile()));
                          },
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
                  //             serviceProviderId:
                  //                 machineData['serviceProviderId'],
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
                  //         goToDetailScreen(
                  //             machineService, serviceProviderModel);
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
              // const MachineCardMobile(
              //   title: 'Arecanut Cutting Machine',
              //   rating: 4.5,
              //   totalRatings: 41,
              //   price: 5320,
              //   serviceProviderName: 'Some Name',
              //   image:
              //       "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
              //   address: 'Kotekere hubli Road, Sirsi',
              // ),
              // const MachineCardMobile(
              //   title: 'Arecanut Cutting Machine',
              //   rating: 4.2,
              //   totalRatings: 32,
              //   price: 5500,
              //   serviceProviderName: 'Some Name',
              //   image:
              //       // "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
              //       "https://5.imimg.com/data5/SELLER/Default/2021/11/UI/FQ/YL/94277487/double-feeding-supari-cutting-machine-500x500.jpg",
              //   address: 'Kotekere hubli Road, Sirsi',
              // ),

              // Container(
              //   padding: EdgeInsets.only(top: Dimensions.ten),
              //   width: double.maxFinite,
              //   child: CustomButton(
              //     title: "View All",
              //     onPressed: () {},
              //     fontSize: Dimensions.fifteen,
              //   ),
              // ),
              Divider(
                color: Colors.black54,
                indent: Dimensions.forty,
                endIndent: Dimensions.forty,
              ),
              Text(
                "Arecanut Price",
                style: TextStyle(fontSize: Dimensions.twenty),
              ),
              SizedBox(
                  width: double.maxFinite, height: 300, child: LineGraph()),
              Divider(
                color: Colors.black54,
                indent: Dimensions.forty,
                endIndent: Dimensions.forty,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      "https://images.unsplash.com/photo-1467803738586-46b7eb7b16a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Center(
                        child: Text(
                      "Leading Arecanut \nService Company in \nSirsi.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.thirty,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
                indent: Dimensions.forty,
                endIndent: Dimensions.forty,
              ),
              const SizedBox(
                height: 15,
              ),
              const Footer()
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) => Padding(
      //     padding: EdgeInsets.all(Dimensions.ten),
      //     child: Container(
      //       width: double.maxFinite,
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(Dimensions.ten),
      //           color: Colors.white,
      //           boxShadow: [
      //             BoxShadow(
      //                 color: Colors.black26,
      //                 blurRadius: Dimensions.five
      //             )
      //           ]
      //       ),
      //       child: Padding(
      //         padding: EdgeInsets.all(Dimensions.ten),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(Dimensions.ten),
      //           child: Row(
      //             children: [
      //               Container(
      //                 // height: 220,
      //                   width: 120,
      //                   color: Colors.grey,
      //                   child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,)
      //               ),
      //               SizedBox(width: Dimensions.ten,),
      //               Expanded(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
      //                     Row(
      //                       children: [
      //                         Text("4.2",style: TextStyle(fontSize: 14),),
      //                         // SizedBox(width: 10,),
      //                         Row(
      //                           children: [
      //                             Icon(Icons.star,color: Colors.orange,size: 15,),
      //                             Icon(Icons.star,color: Colors.orange,size: 15,),
      //                             Icon(Icons.star,color: Colors.orange,size: 15,),
      //                             Icon(Icons.star,color: Colors.orange,size: 15,),
      //                             Icon(Icons.star,color: Colors.orange,size: 15,),
      //                           ],
      //                         ),
      //                         SizedBox(width: 15,),
      //                         Text("32 ratings",style: TextStyle(fontSize: 12),),
      //                       ],
      //                     ),
      //                     Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
      //                     Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
      //                     Divider(),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           height: 40,
      //                           width: 40,
      //                           decoration: BoxDecoration(
      //                             color: Colors.grey.shade300,
      //                             border: Border.all(color: Colors.black38, width: 1),
      //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
      //                           ),
      //                           // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
      //                           child: Icon(Icons.person,),
      //                         ),
      //                         SizedBox(width: Dimensions.ten,),
      //                         Expanded(
      //                           child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
      //                           // child: Column(
      //                           //   mainAxisAlignment: MainAxisAlignment.start,
      //                           //   crossAxisAlignment: CrossAxisAlignment.start,
      //                           //   children: [
      //                           //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
      //                           //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
      //                           //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
      //                           //   ],
      //                           // ),
      //                         )
      //                       ],
      //                     ),
      //                     SizedBox(height: Dimensions.ten,),
      //                     Row(
      //                       children: [
      //                         Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
      //                         SizedBox(width: Dimensions.ten,),
      //                         Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  void goToDetailScreen(MachineService machineService,
      ServiceProviderModel serviceProviderModel, machineId, serviceProvdierId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailScreen(
                  machineService: machineService,
                  serviceProviderModel: serviceProviderModel,
                  machineId: machineId,
                  serviceProviderId: serviceProvdierId,
                )));
  }
}

//========================================================================//

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
                        // Text(
                        //   widget.address,
                        //   style: TextStyle(fontSize: 14, height: 1.5),
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        // Text(
                        //   "Rs : ₹ ${formattedPrice} /-",
                        //   style: TextStyle(fontSize: 18, height: 1.5),
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  // color: Colors.grey.shade300,
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
                                style: TextStyle(fontSize: 14),
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
