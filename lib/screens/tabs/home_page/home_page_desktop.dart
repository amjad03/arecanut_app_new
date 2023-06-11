import 'package:arecanut_app/screens/components/drawers/navigation_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';

import '../../../constants/dimensions.dart';
import '../../../models/data_models/machine_service_model.dart';
import '../../../models/data_models/service_provider_model.dart';
import '../../../repository/auth_repository.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/show_dialogue.dart';
import '../../../widgets/show_message.dart';
import '../../auth/sign_in.dart';
import '../../components/carousel/carousel_page.dart';
import '../../components/graph/line_graph.dart';
import '../../feedback&help/feedback.dart';
import '../../feedback&help/help.dart';
import '../../main_page.dart';
import '../../policies/about.dart';
import '../../policies/privacy_policy.dart';
import '../../profile/profile.dart';
import '../../search_page.dart';
import '../../settings.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  State<HomePageDesktop> createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  final loggedIn = checkLoggedIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  goToMainPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainPage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Logo",
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
      body: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black38, blurRadius: 10),
                ],
              ),
              width: 320,
              child: CustomDrawer()
              // ListView(
              //   padding: const EdgeInsets.all(0),
              //   children: [
              //     DrawerHeader(
              //         decoration: const BoxDecoration(
              //             color: Colors.blue,
              //             image: DecorationImage(
              //               image: NetworkImage(
              //                   'https://images.pexels.com/photos/5409751/pexels-photo-5409751.jpeg?auto=compress&cs=tinysrgb&w=600'),
              //               fit: BoxFit.cover,
              //             )), //BoxDecoration
              //         child: Container(
              //           child: loggedIn
              //               ? Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     CircleAvatar(
              //                       radius: Dimensions.thirty,
              //                       child: Icon(
              //                         Icons.person,
              //                         size: Dimensions.forty,
              //                         color: Colors.grey,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: Dimensions.fifteen,
              //                     ),
              //                     Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       children: [
              //                         Text(
              //                           currentUser?.displayName ?? '',
              //                           style: TextStyle(
              //                               fontSize: Dimensions.twenty,
              //                               color: Colors.white),
              //                         ),
              //                         Text(
              //                           currentUser?.email ?? '',
              //                           style: TextStyle(
              //                               fontSize: Dimensions.fifteen,
              //                               color: Colors.white,
              //                               fontWeight: FontWeight.w300),
              //                         )
              //                       ],
              //                     )
              //                   ],
              //                 )
              //               : Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     CircleAvatar(
              //                       radius: Dimensions.thirty,
              //                       child: Icon(
              //                         Icons.person,
              //                         size: Dimensions.forty,
              //                         color: Colors.grey,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: Dimensions.fifteen,
              //                     ),
              //                     Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       children: [
              //                         customRoundedButton('Login', Icons.login,
              //                             onPressed: () {
              //                           Navigator.push(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       const SignInScreen()));
              //                         })
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //         )),
              //     ListTile(
              //       // selected: _selected == 'favorites' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: FaIcon(
              //         FontAwesomeIcons.solidHeart,
              //         size: Dimensions.twenty,
              //       ),
              //       title: const Text('Favorites'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'favorites';
              //         // });
              //         // loggedIn ? Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesScreen()))
              //         //     : showToast("You are not logged in");
              //       },
              //     ),
              //     customDivider(),
              //     ListTile(
              //       // selected: _selected == 'search' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: const Icon(Icons.search),
              //       title: const Text('Search'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'search';
              //         // });
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const SearchPage()));
              //       },
              //     ),
              //     customDivider(),
              //     ListTile(
              //       // selected: _selected == 'settings' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: const Icon(Icons.settings),
              //       title: const Text('Settings'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'settings';
              //         // });
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const SettingsPage()));
              //       },
              //     ),
              //     customDivider(),
              //     ListTile(
              //       // selected: _selected == 'about' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: const Icon(Icons.info),
              //       title: const Text('About'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'about';
              //         // });
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const AboutPage()));
              //       },
              //     ),
              //     customDivider(),
              //     ListTile(
              //       // selected: _selected == 'help' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: const Icon(Icons.help),
              //       title: const Text('Help'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'help';
              //         // });
              //         loggedIn
              //             ? Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const HelpScreen()))
              //             : showToast("You are not logged in");
              //       },
              //     ),
              //     customDivider(),
              //     ListTile(
              //       // selected: _selected == 'feedback' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: const Icon(Icons.feedback),
              //       title: const Text('Feedback'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'feedback';
              //         // });
              //         loggedIn
              //             ? Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const FeedbackScreen()))
              //             : showToast("You are not logged in");
              //       },
              //     ),
              //     customDivider(),
              //     ListTile(
              //       // selected: _selected == 'privacy' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: const Icon(Icons.privacy_tip),
              //       title: const Text('Privacy & Policy'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'privacy';
              //         // });
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const PrivacyPolicy()));
              //       },
              //     ),
              //     customDivider(),
              //     ListTile(
              //       // selected: _selected == 'logout' ? true : false,
              //       // selectedColor: selectedColor,
              //       leading: const Icon(Icons.logout),
              //       title: const Text('Logout'),
              //       onTap: () {
              //         // setState(() {
              //         //   _selected = 'logout';
              //         // });
              //         // loggedIn ? logout(context)
              //         //     : showToast("You are not logged in");
              //         loggedIn
              //             ? logOutDialogBox(context, goToMainPage())
              //             : showToast("You are not logged in");
              //       },
              //     ),
              //   ],
              // ),
              ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.ten,
                    bottom: Dimensions.ten,
                    left: Dimensions.twenty,
                    right: Dimensions.twenty),
                child: Column(
                  children: [
                    const CustomBannerSliderDesktop(),
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
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('machines')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading...');
                        }

                        final machineDocs = snapshot.data!.docs;

                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: width >= 1650 ? 2 : 1,
                                  childAspectRatio:
                                      width >= 1650 ? 2 / 1.2 : 3 / 1.2,
                                  mainAxisSpacing: Dimensions.fifteen,
                                  crossAxisSpacing: Dimensions.fifteen),
                          shrinkWrap: true,
                          itemCount: machineDocs.length,
                          // itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            final machineData = machineDocs[index].data()
                                as Map<String, dynamic>;
                            final availability = machineData['status'];

                            return GestureDetector(
                              onTap: () async {
                                final serviceProviderId =
                                    machineData['serviceProviderId'];

                                DocumentSnapshot serviceProviderSnapshot =
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(serviceProviderId)
                                        .get();

                                MachineService machineService =
                                    MachineService.fromJson(machineDocs[index]
                                        .data() as Map<String, dynamic>);

                                ServiceProviderModel serviceProviderModel =
                                    ServiceProviderModel.fromJson(
                                        serviceProviderSnapshot.data()
                                            as Map<String, dynamic>);
                              },
                              child: MachineCardDesktop(
                                title: machineData['machineName'],
                                rating: 4.0,
                                totalRatings: 42,
                                price: machineData['price'],
                                serviceProviderName: "Some Name",
                                image: machineData['galleryImages'][0],
                                address: 'Kotekere hubli Road, Sirsi',
                              ),
                            );
                            // return ListTile(
                            //   title: Text('Machine ${index + 1}'),
                            //   subtitle: Text('Availability: $availability'),
                            // );
                          },
                        );
                      },
                    ),
                    // GridView(
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 2,
                    //       childAspectRatio: width >= 1600 ? 2 / 1.2 : 3 / 2,
                    //       mainAxisSpacing: Dimensions.fifteen,
                    //       crossAxisSpacing: Dimensions.fifteen),
                    //   shrinkWrap: true,
                    //   children: const [
                    //     MachineCardDesktop(
                    //       title: 'Arecanut Cutting Machine',
                    //       rating: 4.5,
                    //       totalRatings: 41,
                    //       price: 5320,
                    //       serviceProviderName: 'Some Name',
                    //       image:
                    //           "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
                    //       address: 'Kotekere hubli Road, Sirsi',
                    //     ),
                    //     MachineCardDesktop(
                    //       title: 'Arecanut Cutting Machine',
                    //       rating: 4.2,
                    //       totalRatings: 32,
                    //       price: 5500,
                    //       serviceProviderName: 'Some Name',
                    //       image:
                    //           // "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
                    //           "https://5.imimg.com/data5/SELLER/Default/2021/11/UI/FQ/YL/94277487/double-feeding-supari-cutting-machine-500x500.jpg",
                    //       address: 'Kotekere hubli Road, Sirsi',
                    //     ),
                    //   ],
                    // ),
                    Container(
                      padding: EdgeInsets.only(top: Dimensions.ten),
                      width: double.maxFinite,
                      child: CustomButton(
                        title: "View All",
                        onPressed: () {},
                        fontSize: Dimensions.twenty,
                      ),
                    ),
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
                        width: double.maxFinite,
                        height: 600,
                        child: LineGraph()),
                    Divider(
                      color: Colors.black54,
                      indent: Dimensions.forty,
                      endIndent: Dimensions.forty,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 500,
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
                                fontSize: Dimensions.sixty,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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

  Widget customDivider() {
    return const Divider(
      // color: Colors.grey,
      indent: 15,
      endIndent: 15,
    );
  }
}

//========================================================================//

class MachineCardDesktop extends StatefulWidget {
  const MachineCardDesktop({
    super.key,
    required this.title,
    required this.rating,
    required this.totalRatings,
    required this.price,
    required this.serviceProviderName,
    required this.image,
    required this.address,
  });

  final String title;
  final double rating;
  final int totalRatings;
  final double price;
  final String address;
  final String serviceProviderName;
  final String image;

  @override
  State<MachineCardDesktop> createState() => _MachineCardDesktopState();
}

class _MachineCardDesktopState extends State<MachineCardDesktop> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var formatter = NumberFormat('#,###');
    var formattedPrice = formatter.format(widget.price);

    // return Padding(
    //   padding: EdgeInsets.only(top: Dimensions.ten),
    //   child: Container(
    //     width: double.maxFinite,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(Dimensions.ten),
    //         color: Colors.white,
    //         boxShadow: [
    //           BoxShadow(color: Colors.black26, blurRadius: Dimensions.five)
    //         ]),
    //     child: Padding(
    //       padding: EdgeInsets.all(Dimensions.ten),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(Dimensions.ten),
    //         child: Row(
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(Dimensions.five),
    //               child: Container(
    //                   height: double.maxFinite,
    //                   // width: 220,
    //                   // height: (MediaQuery.of(context).size.height) / 2.5,
    //                   width: (MediaQuery.of(context).size.width) / 6,
    //                   color: Colors.grey,
    //                   child: Image.network(
    //                     widget.image,
    //                     fit: BoxFit.cover,
    //                   )),
    //             ),
    //             SizedBox(
    //               width: Dimensions.ten,
    //             ),
    //             Expanded(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     widget.title,
    //                     style: TextStyle(
    //                       fontSize: 40,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                   Row(
    //                     children: [
    //                       Text(
    //                         widget.rating.toString(),
    //                         style: TextStyle(fontSize: 18),
    //                       ),
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
    //                         initialRating: widget.rating, // The rating value
    //                         minRating: 1, // Minimum rating value
    //                         direction: Axis
    //                             .horizontal, // The direction of the rating bar
    //                         allowHalfRating:
    //                             true, // Allow half ratings (e.g., 3.5 stars)
    //                         itemCount: 5, // Total number of stars
    //                         itemSize: 20, // Size of each star
    //                         itemBuilder: (context, _) => const Icon(
    //                           Icons.star,
    //                           color: Colors.orange, // Color of the filled star
    //                         ),
    //                         onRatingUpdate: (rating) {
    //                           // Callback function when the rating is updated
    //                           print(rating);
    //                         },
    //                       ),
    //                       SizedBox(
    //                         width: 15,
    //                       ),
    //                       Text(
    //                         "${widget.totalRatings} ratings",
    //                         style: TextStyle(fontSize: 18),
    //                       ),
    //                     ],
    //                   ),
    //                   Text(
    //                     widget.address,
    //                     style: TextStyle(
    //                       fontSize: 25,
    //                     ),
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                   Text(
    //                     "Rs : ₹ ${formattedPrice} /-",
    //                     style: TextStyle(
    //                       fontSize: 35,
    //                     ),
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                   Divider(),
    //                   Row(
    //                     children: [
    //                       Container(
    //                         height: 55,
    //                         width: 55,
    //                         decoration: BoxDecoration(
    //                             color: Colors.grey.shade300,
    //                             border:
    //                                 Border.all(color: Colors.black38, width: 1),
    //                             borderRadius:
    //                                 BorderRadius.circular(Dimensions.hundred)),
    //                         // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
    //                         child: Icon(
    //                           Icons.person,
    //                           size: 30,
    //                         ),
    //                       ),
    //                       SizedBox(
    //                         width: Dimensions.ten,
    //                       ),
    //                       Expanded(
    //                         child: Text(
    //                           "Mr. Some Name",
    //                           style: TextStyle(fontSize: 25),
    //                           maxLines: 1,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
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
    //                   SizedBox(
    //                     height: Dimensions.ten,
    //                   ),
    //                   Row(
    //                     children: [
    //                       Expanded(
    //                           child: SizedBox(
    //                         height: 55,
    //                         child: CustomOutlineButton(
    //                           title: "Save to Later",
    //                           onPressed: () {},
    //                           fontSize: Dimensions.fifteen,
    //                         ),
    //                       )),
    //                       SizedBox(
    //                         width: Dimensions.ten,
    //                       ),
    //                       Expanded(
    //                           child: SizedBox(
    //                         height: 55,
    //                         child: CustomButton(
    //                           title: "Book Now",
    //                           onPressed: () {},
    //                           fontSize: Dimensions.fifteen,
    //                         ),
    //                       ))
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
    // );

    return Padding(
      padding: EdgeInsets.only(top: Dimensions.ten),
      child: Container(
        // width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.ten),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: Dimensions.five)
            ]),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.ten),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.ten),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.five),
                  child: Container(
                      // height: 210,
                      height: double.maxFinite,
                      // width: 400,
                      width: width <= 1650
                          ? MediaQuery.of(context).size.width / 4
                          : MediaQuery.of(context).size.width / 6,
                      color: Colors.grey,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: width <= 1650 ? 30 : Dimensions.ten,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: Sizes.forty,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.rating.toString(),
                            style: TextStyle(fontSize: Dimensions.fifteen),
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
                            itemSize: 30, // Size of each star
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
                            width: 25,
                          ),
                          Text(
                            "${widget.totalRatings} ratings",
                            style: TextStyle(fontSize: Dimensions.ten),
                          ),
                        ],
                      ),
                      Text(
                        widget.address,
                        style: TextStyle(
                          fontSize: Dimensions.twenty,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Rs : ₹ ${formattedPrice} /-",
                        style: TextStyle(
                          fontSize: Dimensions.twenty,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Container(
                            height: Sizes.sixty,
                            width: Sizes.sixty,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.hundred)),
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
                              "Mr. Some Name",
                              style: TextStyle(fontSize: Sizes.thirty),
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
                      Column(
                        children: [
                          SizedBox(
                            height: Dimensions.forty,
                            width: double.maxFinite,
                            child: CustomOutlineButton(
                              title: "Save to Later",
                              onPressed: () {},
                              fontSize: Dimensions.fifteen,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.ten,
                          ),
                          SizedBox(
                            height: Dimensions.forty,
                            width: double.maxFinite,
                            child: CustomButton(
                              title: "Book Now",
                              onPressed: () {},
                              fontSize: Dimensions.fifteen,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//===================================================================//

class HomePageDesktop2 extends StatefulWidget {
  const HomePageDesktop2({Key? key}) : super(key: key);

  @override
  State<HomePageDesktop2> createState() => _HomePageDesktop2State();
}

class _HomePageDesktop2State extends State<HomePageDesktop2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<dynamic>>(
        stream: FirebaseFirestore.instance
            .collection('machines')
            .doc('machineId')
            .snapshots()
            .asyncMap((machineSnapshot) async {
          final serviceProviderId =
              machineSnapshot.data()!['serviceProviderId'];

          final otherDataSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(serviceProviderId)
              .get();

          return [machineSnapshot, otherDataSnapshot];
        }),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          if (!snapshot.hasData) {
            return Text('Data not available');
          }

          // Access the machine's status data
          final machineStatus = snapshot.data![0].data()['status'];

          // Access other data from the second collection
          final otherData = snapshot.data![1].data()['otherField'];

          // Render the UI based on the data
          return ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => NextScreen(machineStatus: machineStatus, otherData: otherData),
              //   ),
              // );
            },
            child: Text('Next Screen'),
          );
        },
      ),
      // body: StreamBuilder<List<dynamic>>(
      //   stream: Rx.zip2(
      //     FirebaseFirestore.instance
      //         .collection('machines')
      //         .doc('machineId')
      //         .snapshots(),
      //     FirebaseFirestore.instance
      //         .collection('users')
      //         .doc(serviceProviderId)
      //         .snapshots(),
      //     (DocumentSnapshot machineSnapshot,
      //         DocumentSnapshot otherDataSnapshot) {
      //       return [machineSnapshot, otherDataSnapshot];
      //     },
      //   ),
      //   builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      //     if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     }
      //
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Text('Loading...');
      //     }
      //
      //     if (!snapshot.hasData) {
      //       return Text('Data not available');
      //     }
      //
      //     // Access the machine's status data
      //     final machineStatus = snapshot.data![0].data()['status'];
      //
      //     // Access other data from the second collection
      //     final otherData = snapshot.data![1].data()['otherField'];
      //
      //     // Render the UI based on the data
      //     return ElevatedButton(
      //       onPressed: () {
      //         // Navigator.push(
      //         //   context,
      //         //   MaterialPageRoute(
      //         //     builder: (context) => NextScreen(machineStatus: machineStatus, otherData: otherData),
      //         //   ),
      //         // );
      //       },
      //       child: Text('Next Screen'),
      //     );
      //   },
      // ),
    );
  }
}
