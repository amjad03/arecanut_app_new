import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page_desktop.dart';
import 'home_page_mobile.dart';
import 'home_page_tablet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    print(x);
    return ScreenTypeLayout.builder(
      breakpoints:
          const ScreenBreakpoints(desktop: 1285, tablet: 650, watch: 250),
      mobile: (_) => const HomePageMobile(),
      desktop: (_) => const HomePageDesktop(),
      tablet: (_) => const HomePageTablet(),

      // mobile: (_) => OrientationLayoutBuilder(
      //   portrait: (context) => HomeMobilePortrait(),
      //   landscape: (context) => HomeMobileLandscape(),
      // ),
    );
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: EdgeInsets.all(Dimensions.ten),
    //       child: Column(
    //         children: [
    //           // Padding(
    //           //   padding: EdgeInsets.only(top: Dimensions.ten),
    //           //   child: Container(
    //           //     color: Colors.grey.shade300,
    //           //     width: double.maxFinite,
    //           //     height: 180,
    //           //   ),
    //           // ),
    //           const CustomBannerSlider(),
    //           SizedBox(
    //             height: Dimensions.ten,
    //           ),
    //           Text(
    //             "Top Rated",
    //             style: TextStyle(fontSize: Dimensions.twenty),
    //           ),
    //           Divider(
    //             color: Colors.black54,
    //             indent: Dimensions.forty,
    //             endIndent: Dimensions.forty,
    //           ),
    //           // Padding(
    //           //   padding: EdgeInsets.only(top: Dimensions.ten),
    //           //   child: Container(
    //           //     width: double.maxFinite,
    //           //     decoration: BoxDecoration(
    //           //         borderRadius: BorderRadius.circular(Dimensions.ten),
    //           //         color: Colors.white,
    //           //         boxShadow: [
    //           //           BoxShadow(
    //           //               color: Colors.black26,
    //           //               blurRadius: Dimensions.five
    //           //           )
    //           //         ]
    //           //     ),
    //           //     child: Padding(
    //           //       padding: EdgeInsets.all(Dimensions.ten),
    //           //       child: ClipRRect(
    //           //         borderRadius: BorderRadius.circular(Dimensions.ten),
    //           //         child: Row(
    //           //           children: [
    //           //             ClipRRect(
    //           //               borderRadius: BorderRadius.circular(Dimensions.five),
    //           //               child: Container(
    //           //                 height: 180,
    //           //                 width: 120,
    //           //                 color: Colors.grey,
    //           //                 child: Image.network("https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",fit: BoxFit.cover,)
    //           //               ),
    //           //             ),
    //           //             SizedBox(width: Dimensions.ten,),
    //           //             Expanded(
    //           //               child: Column(
    //           //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           //                 crossAxisAlignment: CrossAxisAlignment.start,
    //           //                 children: [
    //           //                   Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //           //                   Row(
    //           //                     children: [
    //           //                       Text("4.5",style: TextStyle(fontSize: 14),),
    //           //                       // SizedBox(width: 10,),
    //           //                       // Row(
    //           //                       //   children: [
    //           //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
    //           //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
    //           //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
    //           //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
    //           //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
    //           //                       //   ],
    //           //                       // ),
    //           //                       RatingBar.builder(
    //           //                         initialRating: 4.5, // The rating value
    //           //                         minRating: 1, // Minimum rating value
    //           //                         direction: Axis.horizontal, // The direction of the rating bar
    //           //                         allowHalfRating: true, // Allow half ratings (e.g., 3.5 stars)
    //           //                         itemCount: 5, // Total number of stars
    //           //                         itemSize: 15, // Size of each star
    //           //                         itemBuilder: (context, _) => const Icon(
    //           //                           Icons.star,
    //           //                           color: Colors.orange, // Color of the filled star
    //           //                         ),
    //           //                         onRatingUpdate: (rating) {
    //           //                           // Callback function when the rating is updated
    //           //                           print(rating);
    //           //                         },
    //           //                       ),
    //           //                       SizedBox(width: 15,),
    //           //                       Text("32 ratings",style: TextStyle(fontSize: 12),),
    //           //                     ],
    //           //                   ),
    //           //                   Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //           //                   Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //           //                   Divider(),
    //           //                   Row(
    //           //                     children: [
    //           //                       Container(
    //           //                         height: 40,
    //           //                         width: 40,
    //           //                         decoration: BoxDecoration(
    //           //                             color: Colors.grey.shade300,
    //           //                             border: Border.all(color: Colors.black38, width: 1),
    //           //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
    //           //                         ),
    //           //                         // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
    //           //                         child: Icon(Icons.person,),
    //           //                       ),
    //           //                       SizedBox(width: Dimensions.ten,),
    //           //                       Expanded(
    //           //                         child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //           //                         // child: Column(
    //           //                         //   mainAxisAlignment: MainAxisAlignment.start,
    //           //                         //   crossAxisAlignment: CrossAxisAlignment.start,
    //           //                         //   children: [
    //           //                         //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //           //                         //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //           //                         //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //           //                         //   ],
    //           //                         // ),
    //           //                       )
    //           //                     ],
    //           //                   ),
    //           //                   SizedBox(height: Dimensions.ten,),
    //           //                   Row(
    //           //                     children: [
    //           //                       Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
    //           //                       SizedBox(width: Dimensions.ten,),
    //           //                       Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
    //           //                     ],
    //           //                   )
    //           //                 ],
    //           //               ),
    //           //             )
    //           //           ],
    //           //         ),
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ),
    //           MachineCard(
    //             title: 'Arecanut Cutting Machine',
    //             rating: 4.5,
    //             totalRatings: 41,
    //             price: 5320,
    //             serviceProviderName: 'Some Name',
    //             image:
    //                 "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
    //             address: 'Kotekere hubli Road, Sirsi',
    //           ),
    //           MachineCard(
    //             title: 'Arecanut Cutting Machine',
    //             rating: 4.2,
    //             totalRatings: 32,
    //             price: 5500,
    //             serviceProviderName: 'Some Name',
    //             image:
    //                 // "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
    //                 "https://5.imimg.com/data5/SELLER/Default/2021/11/UI/FQ/YL/94277487/double-feeding-supari-cutting-machine-500x500.jpg",
    //             address: 'Kotekere hubli Road, Sirsi',
    //           ),
    //           Container(
    //             padding: EdgeInsets.only(top: Dimensions.ten),
    //             width: double.maxFinite,
    //             child: CustomButton(title: "View All", onPressed: () {}),
    //           ),
    //           Divider(
    //             color: Colors.black54,
    //             indent: Dimensions.forty,
    //             endIndent: Dimensions.forty,
    //           ),
    //           Text(
    //             "Arecanut Price",
    //             style: TextStyle(fontSize: Dimensions.twenty),
    //           ),
    //           SizedBox(
    //               width: double.maxFinite, height: 300, child: LineGraph()),
    //           Divider(
    //             color: Colors.black54,
    //             indent: Dimensions.forty,
    //             endIndent: Dimensions.forty,
    //           ),
    //           SizedBox(
    //             width: double.maxFinite,
    //             height: 200,
    //             child: Stack(
    //               fit: StackFit.expand,
    //               children: [
    //                 Image.network(
    //                   "https://images.unsplash.com/photo-1467803738586-46b7eb7b16a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
    //                   fit: BoxFit.cover,
    //                 ),
    //                 Container(
    //                   color: Colors.black.withOpacity(0.3),
    //                 ),
    //                 Center(
    //                     child: Text(
    //                   "Leading Arecanut \nService Company in \nSirsi.",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: Dimensions.thirty,
    //                       fontWeight: FontWeight.w900),
    //                   textAlign: TextAlign.center,
    //                 ))
    //               ],
    //             ),
    //           ),
    //           Divider(
    //             color: Colors.black54,
    //             indent: Dimensions.forty,
    //             endIndent: Dimensions.forty,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   // body: ListView.builder(
    //   //   itemCount: 10,
    //   //   itemBuilder: (context, index) => Padding(
    //   //     padding: EdgeInsets.all(Dimensions.ten),
    //   //     child: Container(
    //   //       width: double.maxFinite,
    //   //       decoration: BoxDecoration(
    //   //           borderRadius: BorderRadius.circular(Dimensions.ten),
    //   //           color: Colors.white,
    //   //           boxShadow: [
    //   //             BoxShadow(
    //   //                 color: Colors.black26,
    //   //                 blurRadius: Dimensions.five
    //   //             )
    //   //           ]
    //   //       ),
    //   //       child: Padding(
    //   //         padding: EdgeInsets.all(Dimensions.ten),
    //   //         child: ClipRRect(
    //   //           borderRadius: BorderRadius.circular(Dimensions.ten),
    //   //           child: Row(
    //   //             children: [
    //   //               Container(
    //   //                 // height: 220,
    //   //                   width: 120,
    //   //                   color: Colors.grey,
    //   //                   child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,)
    //   //               ),
    //   //               SizedBox(width: Dimensions.ten,),
    //   //               Expanded(
    //   //                 child: Column(
    //   //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   //                   crossAxisAlignment: CrossAxisAlignment.start,
    //   //                   children: [
    //   //                     Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //   //                     Row(
    //   //                       children: [
    //   //                         Text("4.2",style: TextStyle(fontSize: 14),),
    //   //                         // SizedBox(width: 10,),
    //   //                         Row(
    //   //                           children: [
    //   //                             Icon(Icons.star,color: Colors.orange,size: 15,),
    //   //                             Icon(Icons.star,color: Colors.orange,size: 15,),
    //   //                             Icon(Icons.star,color: Colors.orange,size: 15,),
    //   //                             Icon(Icons.star,color: Colors.orange,size: 15,),
    //   //                             Icon(Icons.star,color: Colors.orange,size: 15,),
    //   //                           ],
    //   //                         ),
    //   //                         SizedBox(width: 15,),
    //   //                         Text("32 ratings",style: TextStyle(fontSize: 12),),
    //   //                       ],
    //   //                     ),
    //   //                     Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //   //                     Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //   //                     Divider(),
    //   //                     Row(
    //   //                       children: [
    //   //                         Container(
    //   //                           height: 40,
    //   //                           width: 40,
    //   //                           decoration: BoxDecoration(
    //   //                             color: Colors.grey.shade300,
    //   //                             border: Border.all(color: Colors.black38, width: 1),
    //   //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
    //   //                           ),
    //   //                           // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
    //   //                           child: Icon(Icons.person,),
    //   //                         ),
    //   //                         SizedBox(width: Dimensions.ten,),
    //   //                         Expanded(
    //   //                           child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //   //                           // child: Column(
    //   //                           //   mainAxisAlignment: MainAxisAlignment.start,
    //   //                           //   crossAxisAlignment: CrossAxisAlignment.start,
    //   //                           //   children: [
    //   //                           //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //   //                           //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //   //                           //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
    //   //                           //   ],
    //   //                           // ),
    //   //                         )
    //   //                       ],
    //   //                     ),
    //   //                     SizedBox(height: Dimensions.ten,),
    //   //                     Row(
    //   //                       children: [
    //   //                         Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
    //   //                         SizedBox(width: Dimensions.ten,),
    //   //                         Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
    //   //                       ],
    //   //                     )
    //   //                   ],
    //   //                 ),
    //   //               )
    //   //             ],
    //   //           ),
    //   //         ),
    //   //       ),
    //   //     ),
    //   //   ),
    //   // ),
    // );
  }
}

// import 'package:arecanut_app/constants/dimensions.dart';
// import 'package:arecanut_app/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:intl/intl.dart';
//
// import '../components/carousel/carousel_page.dart';
// import '../components/graph/line_graph.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final maxWidth = constraints.maxWidth;
//
//         return Scaffold(
//           body: ListView(
//             padding: EdgeInsets.all(Dimensions.ten),
//             children: [
//               const CustomBannerSlider(),
//               SizedBox(height: Dimensions.ten),
//               Text(
//                 "Top Rated",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               GridView.count(
//                 crossAxisCount: maxWidth >= 1200 ? 3 : 2,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   MachineCard(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.5,
//                     totalRatings: 41,
//                     price: 5320,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                   MachineCard(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.2,
//                     totalRatings: 32,
//                     price: 5500,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                   MachineCard(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.5,
//                     totalRatings: 41,
//                     price: 5320,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                   MachineCard(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.2,
//                     totalRatings: 32,
//                     price: 5500,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                   MachineCard(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.5,
//                     totalRatings: 41,
//                     price: 5320,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                   MachineCard(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.2,
//                     totalRatings: 32,
//                     price: 5500,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                 ],
//               ),
//               SizedBox(height: Dimensions.ten),
//               Container(
//                 alignment: Alignment.center,
//                 child: CustomButton(title: "View All", onPressed: () {}),
//               ),
//               SizedBox(height: Dimensions.twenty),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               Text(
//                 "Arecanut Price",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 height: 300,
//                 child: LineGraph(),
//               ),
//               SizedBox(height: Dimensions.ten),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 height: 200,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.network(
//                       "https://images.unsplash.com/photo-1467803738586-46b7eb7b16a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB",
//                       fit: BoxFit.cover,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MachineCard extends StatelessWidget {
//   final String title;
//   final double rating;
//   final int totalRatings;
//   final int price;
//   final String serviceProviderName;
//   final String image;
//   final String address;
//
//   const MachineCard({
//     required this.title,
//     required this.rating,
//     required this.totalRatings,
//     required this.price,
//     required this.serviceProviderName,
//     required this.image,
//     required this.address,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2.0,
//       child: Padding(
//         padding: EdgeInsets.all(Dimensions.ten),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: SizedBox(
//                 // height: 150,
//                 width: double.infinity,
//                 child: Image.network(
//                   image,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: Dimensions.ten),
//             Text(
//               title,
//               style: TextStyle(fontSize: Dimensions.fifteen),
//             ),
//             SizedBox(height: Dimensions.five),
//             RatingBar.builder(
//               itemSize: 15,
//               initialRating: rating,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemPadding: EdgeInsets.zero,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {},
//             ),
//             SizedBox(height: Dimensions.five),
//             Text(
//               "$totalRatings Ratings",
//               style: TextStyle(fontSize: Dimensions.ten),
//             ),
//             SizedBox(height: Dimensions.five),
//             Text(
//               "\$${NumberFormat('#,###').format(price)}",
//               style: TextStyle(
//                 fontSize: Dimensions.fifteen,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: Dimensions.five),
//             Text(
//               serviceProviderName,
//               style: TextStyle(fontSize: Dimensions.ten),
//             ),
//             SizedBox(height: Dimensions.five),
//             Text(
//               address,
//               style: TextStyle(fontSize: Dimensions.ten),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//=======================================================//

// class HomePageMobile extends StatefulWidget {
//   const HomePageMobile({Key? key}) : super(key: key);
//
//   @override
//   State<HomePageMobile> createState() => _HomePageMobileState();
// }
//
// class _HomePageMobileState extends State<HomePageMobile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(Dimensions.ten),
//           child: Column(
//             children: [
//               // Padding(
//               //   padding: EdgeInsets.only(top: Dimensions.ten),
//               //   child: Container(
//               //     color: Colors.grey.shade300,
//               //     width: double.maxFinite,
//               //     height: 180,
//               //   ),
//               // ),
//               const CustomBannerSliderMobile(),
//               SizedBox(
//                 height: Dimensions.ten,
//               ),
//               Text(
//                 "Top Rated",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               // Padding(
//               //   padding: EdgeInsets.only(top: Dimensions.ten),
//               //   child: Container(
//               //     width: double.maxFinite,
//               //     decoration: BoxDecoration(
//               //         borderRadius: BorderRadius.circular(Dimensions.ten),
//               //         color: Colors.white,
//               //         boxShadow: [
//               //           BoxShadow(
//               //               color: Colors.black26,
//               //               blurRadius: Dimensions.five
//               //           )
//               //         ]
//               //     ),
//               //     child: Padding(
//               //       padding: EdgeInsets.all(Dimensions.ten),
//               //       child: ClipRRect(
//               //         borderRadius: BorderRadius.circular(Dimensions.ten),
//               //         child: Row(
//               //           children: [
//               //             ClipRRect(
//               //               borderRadius: BorderRadius.circular(Dimensions.five),
//               //               child: Container(
//               //                 height: 180,
//               //                 width: 120,
//               //                 color: Colors.grey,
//               //                 child: Image.network("https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",fit: BoxFit.cover,)
//               //               ),
//               //             ),
//               //             SizedBox(width: Dimensions.ten,),
//               //             Expanded(
//               //               child: Column(
//               //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //                 crossAxisAlignment: CrossAxisAlignment.start,
//               //                 children: [
//               //                   Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
//               //                   Row(
//               //                     children: [
//               //                       Text("4.5",style: TextStyle(fontSize: 14),),
//               //                       // SizedBox(width: 10,),
//               //                       // Row(
//               //                       //   children: [
//               //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
//               //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
//               //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
//               //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
//               //                       //     Icon(Icons.star,color: Colors.orange,size: 15,),
//               //                       //   ],
//               //                       // ),
//               //                       RatingBar.builder(
//               //                         initialRating: 4.5, // The rating value
//               //                         minRating: 1, // Minimum rating value
//               //                         direction: Axis.horizontal, // The direction of the rating bar
//               //                         allowHalfRating: true, // Allow half ratings (e.g., 3.5 stars)
//               //                         itemCount: 5, // Total number of stars
//               //                         itemSize: 15, // Size of each star
//               //                         itemBuilder: (context, _) => const Icon(
//               //                           Icons.star,
//               //                           color: Colors.orange, // Color of the filled star
//               //                         ),
//               //                         onRatingUpdate: (rating) {
//               //                           // Callback function when the rating is updated
//               //                           print(rating);
//               //                         },
//               //                       ),
//               //                       SizedBox(width: 15,),
//               //                       Text("32 ratings",style: TextStyle(fontSize: 12),),
//               //                     ],
//               //                   ),
//               //                   Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//               //                   Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
//               //                   Divider(),
//               //                   Row(
//               //                     children: [
//               //                       Container(
//               //                         height: 40,
//               //                         width: 40,
//               //                         decoration: BoxDecoration(
//               //                             color: Colors.grey.shade300,
//               //                             border: Border.all(color: Colors.black38, width: 1),
//               //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
//               //                         ),
//               //                         // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
//               //                         child: Icon(Icons.person,),
//               //                       ),
//               //                       SizedBox(width: Dimensions.ten,),
//               //                       Expanded(
//               //                         child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//               //                         // child: Column(
//               //                         //   mainAxisAlignment: MainAxisAlignment.start,
//               //                         //   crossAxisAlignment: CrossAxisAlignment.start,
//               //                         //   children: [
//               //                         //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
//               //                         //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//               //                         //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//               //                         //   ],
//               //                         // ),
//               //                       )
//               //                     ],
//               //                   ),
//               //                   SizedBox(height: Dimensions.ten,),
//               //                   Row(
//               //                     children: [
//               //                       Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
//               //                       SizedBox(width: Dimensions.ten,),
//               //                       Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
//               //                     ],
//               //                   )
//               //                 ],
//               //               ),
//               //             )
//               //           ],
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               const MachineCardMobile(
//                 title: 'Arecanut Cutting Machine',
//                 rating: 4.5,
//                 totalRatings: 41,
//                 price: 5320,
//                 serviceProviderName: 'Some Name',
//                 image:
//                     "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
//                 address: 'Kotekere hubli Road, Sirsi',
//               ),
//               const MachineCardMobile(
//                 title: 'Arecanut Cutting Machine',
//                 rating: 4.2,
//                 totalRatings: 32,
//                 price: 5500,
//                 serviceProviderName: 'Some Name',
//                 image:
//                     // "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
//                     "https://5.imimg.com/data5/SELLER/Default/2021/11/UI/FQ/YL/94277487/double-feeding-supari-cutting-machine-500x500.jpg",
//                 address: 'Kotekere hubli Road, Sirsi',
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: Dimensions.ten),
//                 width: double.maxFinite,
//                 child: CustomButton(
//                   title: "View All",
//                   onPressed: () {},
//                   fontSize: Dimensions.fifteen,
//                 ),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               Text(
//                 "Arecanut Price",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               SizedBox(
//                   width: double.maxFinite, height: 300, child: LineGraph()),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 height: 200,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.network(
//                       "https://images.unsplash.com/photo-1467803738586-46b7eb7b16a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
//                       fit: BoxFit.cover,
//                     ),
//                     Container(
//                       color: Colors.black.withOpacity(0.3),
//                     ),
//                     Center(
//                         child: Text(
//                       "Leading Arecanut \nService Company in \nSirsi.",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: Dimensions.thirty,
//                           fontWeight: FontWeight.w900),
//                       textAlign: TextAlign.center,
//                     ))
//                   ],
//                 ),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//             ],
//           ),
//         ),
//       ),
//       // body: ListView.builder(
//       //   itemCount: 10,
//       //   itemBuilder: (context, index) => Padding(
//       //     padding: EdgeInsets.all(Dimensions.ten),
//       //     child: Container(
//       //       width: double.maxFinite,
//       //       decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(Dimensions.ten),
//       //           color: Colors.white,
//       //           boxShadow: [
//       //             BoxShadow(
//       //                 color: Colors.black26,
//       //                 blurRadius: Dimensions.five
//       //             )
//       //           ]
//       //       ),
//       //       child: Padding(
//       //         padding: EdgeInsets.all(Dimensions.ten),
//       //         child: ClipRRect(
//       //           borderRadius: BorderRadius.circular(Dimensions.ten),
//       //           child: Row(
//       //             children: [
//       //               Container(
//       //                 // height: 220,
//       //                   width: 120,
//       //                   color: Colors.grey,
//       //                   child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,)
//       //               ),
//       //               SizedBox(width: Dimensions.ten,),
//       //               Expanded(
//       //                 child: Column(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   children: [
//       //                     Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Row(
//       //                       children: [
//       //                         Text("4.2",style: TextStyle(fontSize: 14),),
//       //                         // SizedBox(width: 10,),
//       //                         Row(
//       //                           children: [
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                           ],
//       //                         ),
//       //                         SizedBox(width: 15,),
//       //                         Text("32 ratings",style: TextStyle(fontSize: 12),),
//       //                       ],
//       //                     ),
//       //                     Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Divider(),
//       //                     Row(
//       //                       children: [
//       //                         Container(
//       //                           height: 40,
//       //                           width: 40,
//       //                           decoration: BoxDecoration(
//       //                             color: Colors.grey.shade300,
//       //                             border: Border.all(color: Colors.black38, width: 1),
//       //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
//       //                           ),
//       //                           // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
//       //                           child: Icon(Icons.person,),
//       //                         ),
//       //                         SizedBox(width: Dimensions.ten,),
//       //                         Expanded(
//       //                           child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           // child: Column(
//       //                           //   mainAxisAlignment: MainAxisAlignment.start,
//       //                           //   crossAxisAlignment: CrossAxisAlignment.start,
//       //                           //   children: [
//       //                           //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //   ],
//       //                           // ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                     SizedBox(height: Dimensions.ten,),
//       //                     Row(
//       //                       children: [
//       //                         Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
//       //                         SizedBox(width: Dimensions.ten,),
//       //                         Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
//       //                       ],
//       //                     )
//       //                   ],
//       //                 ),
//       //               )
//       //             ],
//       //           ),
//       //         ),
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
// class _HomePageMobileState extends State<HomePageMobile> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Center(
//       child: Text("Mobile View"),
//     ));
//   }
// }

//--------------------------------------------------------

// class HomePageTablet extends StatefulWidget {
//   const HomePageTablet({Key? key}) : super(key: key);
//
//   @override
//   State<HomePageTablet> createState() => _HomePageTabletState();
// }
//
// class _HomePageTabletState extends State<HomePageTablet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(Dimensions.ten),
//           child: Column(
//             children: [
//               // Padding(
//               //   padding: EdgeInsets.only(top: Dimensions.ten),
//               //   child: Container(
//               //     color: Colors.grey.shade300,
//               //     width: double.maxFinite,
//               //     height: 180,
//               //   ),
//               // ),
//               const CustomBannerSliderTablet(),
//               SizedBox(
//                 height: Dimensions.ten,
//               ),
//               Text(
//                 "Top Rated",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               const MachineCardTablet(
//                 title: 'Arecanut Cutting Machine',
//                 rating: 4.5,
//                 totalRatings: 41,
//                 price: 5320,
//                 serviceProviderName: 'Some Name',
//                 image:
//                     "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
//                 address: 'Kotekere hubli Road, Sirsi',
//               ),
//               const MachineCardTablet(
//                 title: 'Arecanut Cutting Machine',
//                 rating: 4.2,
//                 totalRatings: 32,
//                 price: 5500,
//                 serviceProviderName: 'Some Name',
//                 image:
//                     // "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
//                     "https://5.imimg.com/data5/SELLER/Default/2021/11/UI/FQ/YL/94277487/double-feeding-supari-cutting-machine-500x500.jpg",
//                 address: 'Kotekere hubli Road, Sirsi',
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: Dimensions.ten),
//                 width: double.maxFinite,
//                 child: CustomButton(
//                   title: "View All",
//                   onPressed: () {},
//                   fontSize: Dimensions.fifteen,
//                 ),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               Text(
//                 "Arecanut Price",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               SizedBox(
//                   width: double.maxFinite, height: 300, child: LineGraph()),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 height: 200,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.network(
//                       "https://images.unsplash.com/photo-1467803738586-46b7eb7b16a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
//                       fit: BoxFit.cover,
//                     ),
//                     Container(
//                       color: Colors.black.withOpacity(0.3),
//                     ),
//                     Center(
//                         child: Text(
//                       "Leading Arecanut \nService Company in \nSirsi.",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: Dimensions.thirty,
//                           fontWeight: FontWeight.w900),
//                       textAlign: TextAlign.center,
//                     ))
//                   ],
//                 ),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//             ],
//           ),
//         ),
//       ),
//       // body: ListView.builder(
//       //   itemCount: 10,
//       //   itemBuilder: (context, index) => Padding(
//       //     padding: EdgeInsets.all(Dimensions.ten),
//       //     child: Container(
//       //       width: double.maxFinite,
//       //       decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(Dimensions.ten),
//       //           color: Colors.white,
//       //           boxShadow: [
//       //             BoxShadow(
//       //                 color: Colors.black26,
//       //                 blurRadius: Dimensions.five
//       //             )
//       //           ]
//       //       ),
//       //       child: Padding(
//       //         padding: EdgeInsets.all(Dimensions.ten),
//       //         child: ClipRRect(
//       //           borderRadius: BorderRadius.circular(Dimensions.ten),
//       //           child: Row(
//       //             children: [
//       //               Container(
//       //                 // height: 220,
//       //                   width: 120,
//       //                   color: Colors.grey,
//       //                   child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,)
//       //               ),
//       //               SizedBox(width: Dimensions.ten,),
//       //               Expanded(
//       //                 child: Column(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   children: [
//       //                     Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Row(
//       //                       children: [
//       //                         Text("4.2",style: TextStyle(fontSize: 14),),
//       //                         // SizedBox(width: 10,),
//       //                         Row(
//       //                           children: [
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                           ],
//       //                         ),
//       //                         SizedBox(width: 15,),
//       //                         Text("32 ratings",style: TextStyle(fontSize: 12),),
//       //                       ],
//       //                     ),
//       //                     Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Divider(),
//       //                     Row(
//       //                       children: [
//       //                         Container(
//       //                           height: 40,
//       //                           width: 40,
//       //                           decoration: BoxDecoration(
//       //                             color: Colors.grey.shade300,
//       //                             border: Border.all(color: Colors.black38, width: 1),
//       //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
//       //                           ),
//       //                           // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
//       //                           child: Icon(Icons.person,),
//       //                         ),
//       //                         SizedBox(width: Dimensions.ten,),
//       //                         Expanded(
//       //                           child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           // child: Column(
//       //                           //   mainAxisAlignment: MainAxisAlignment.start,
//       //                           //   crossAxisAlignment: CrossAxisAlignment.start,
//       //                           //   children: [
//       //                           //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //   ],
//       //                           // ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                     SizedBox(height: Dimensions.ten,),
//       //                     Row(
//       //                       children: [
//       //                         Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
//       //                         SizedBox(width: Dimensions.ten,),
//       //                         Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
//       //                       ],
//       //                     )
//       //                   ],
//       //                 ),
//       //               )
//       //             ],
//       //           ),
//       //         ),
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
// class _HomePageTabletState extends State<HomePageTablet> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Center(
//       child: Text("Tablet View"),
//     ));
//   }
// }

//===================================================================//

// class HomePageDesktop extends StatefulWidget {
//   const HomePageDesktop({Key? key}) : super(key: key);
//
//   @override
//   State<HomePageDesktop> createState() => _HomePageDesktopState();
// }
//
// class _HomePageDesktopState extends State<HomePageDesktop> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//               top: Dimensions.ten,
//               bottom: Dimensions.ten,
//               left: Dimensions.twenty,
//               right: Dimensions.twenty),
//           child: Column(
//             children: [
//               const CustomBannerSliderDesktop(),
//               SizedBox(
//                 height: Dimensions.ten,
//               ),
//               Text(
//                 "Top Rated",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               GridView(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 3 / 1.7,
//                     mainAxisSpacing: Dimensions.fifteen,
//                     crossAxisSpacing: Dimensions.fifteen),
//                 shrinkWrap: true,
//                 children: const [
//                   MachineCardDesktop(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.5,
//                     totalRatings: 41,
//                     price: 5320,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         "https://5.imimg.com/data5/ANDROID/Default/2022/1/RT/QX/DK/43977406/product-jpeg-250x250.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                   MachineCardDesktop(
//                     title: 'Arecanut Cutting Machine',
//                     rating: 4.2,
//                     totalRatings: 32,
//                     price: 5500,
//                     serviceProviderName: 'Some Name',
//                     image:
//                         // "https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",
//                         "https://5.imimg.com/data5/SELLER/Default/2021/11/UI/FQ/YL/94277487/double-feeding-supari-cutting-machine-500x500.jpg",
//                     address: 'Kotekere hubli Road, Sirsi',
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: Dimensions.ten),
//                 width: double.maxFinite,
//                 child: CustomButton(
//                   title: "View All",
//                   onPressed: () {},
//                   fontSize: Dimensions.twenty,
//                 ),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               Text(
//                 "Arecanut Price",
//                 style: TextStyle(fontSize: Dimensions.twenty),
//               ),
//               SizedBox(
//                   width: double.maxFinite, height: 600, child: LineGraph()),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 height: 500,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     Image.network(
//                       "https://images.unsplash.com/photo-1467803738586-46b7eb7b16a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80",
//                       fit: BoxFit.cover,
//                     ),
//                     Container(
//                       color: Colors.black.withOpacity(0.3),
//                     ),
//                     Center(
//                         child: Text(
//                       "Leading Arecanut \nService Company in \nSirsi.",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: Dimensions.sixty,
//                           fontWeight: FontWeight.w900),
//                       textAlign: TextAlign.center,
//                     ))
//                   ],
//                 ),
//               ),
//               Divider(
//                 color: Colors.black54,
//                 indent: Dimensions.forty,
//                 endIndent: Dimensions.forty,
//               ),
//             ],
//           ),
//         ),
//       ),
//       // body: ListView.builder(
//       //   itemCount: 10,
//       //   itemBuilder: (context, index) => Padding(
//       //     padding: EdgeInsets.all(Dimensions.ten),
//       //     child: Container(
//       //       width: double.maxFinite,
//       //       decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(Dimensions.ten),
//       //           color: Colors.white,
//       //           boxShadow: [
//       //             BoxShadow(
//       //                 color: Colors.black26,
//       //                 blurRadius: Dimensions.five
//       //             )
//       //           ]
//       //       ),
//       //       child: Padding(
//       //         padding: EdgeInsets.all(Dimensions.ten),
//       //         child: ClipRRect(
//       //           borderRadius: BorderRadius.circular(Dimensions.ten),
//       //           child: Row(
//       //             children: [
//       //               Container(
//       //                 // height: 220,
//       //                   width: 120,
//       //                   color: Colors.grey,
//       //                   child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,)
//       //               ),
//       //               SizedBox(width: Dimensions.ten,),
//       //               Expanded(
//       //                 child: Column(
//       //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //                   crossAxisAlignment: CrossAxisAlignment.start,
//       //                   children: [
//       //                     Text("Arecanut Cutting Machine",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Row(
//       //                       children: [
//       //                         Text("4.2",style: TextStyle(fontSize: 14),),
//       //                         // SizedBox(width: 10,),
//       //                         Row(
//       //                           children: [
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                             Icon(Icons.star,color: Colors.orange,size: 15,),
//       //                           ],
//       //                         ),
//       //                         SizedBox(width: 15,),
//       //                         Text("32 ratings",style: TextStyle(fontSize: 12),),
//       //                       ],
//       //                     ),
//       //                     Text("Kotekere Hubli Road Sirsi",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Text("Rs : ₹ 5,500 /-",style: TextStyle(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                     Divider(),
//       //                     Row(
//       //                       children: [
//       //                         Container(
//       //                           height: 40,
//       //                           width: 40,
//       //                           decoration: BoxDecoration(
//       //                             color: Colors.grey.shade300,
//       //                             border: Border.all(color: Colors.black38, width: 1),
//       //                             borderRadius: BorderRadius.circular(Dimensions.hundred)
//       //                           ),
//       //                           // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
//       //                           child: Icon(Icons.person,),
//       //                         ),
//       //                         SizedBox(width: Dimensions.ten,),
//       //                         Expanded(
//       //                           child: Text("Mr. Some Name",style: TextStyle(fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           // child: Column(
//       //                           //   mainAxisAlignment: MainAxisAlignment.start,
//       //                           //   crossAxisAlignment: CrossAxisAlignment.start,
//       //                           //   children: [
//       //                           //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//       //                           //   ],
//       //                           // ),
//       //                         )
//       //                       ],
//       //                     ),
//       //                     SizedBox(height: Dimensions.ten,),
//       //                     Row(
//       //                       children: [
//       //                         Expanded(child: CustomOutlineButton(title: "Save to Later", onPressed: (){})),
//       //                         SizedBox(width: Dimensions.ten,),
//       //                         Expanded(child: CustomButton(title: "Book Now", onPressed: (){}))
//       //                       ],
//       //                     )
//       //                   ],
//       //                 ),
//       //               )
//       //             ],
//       //           ),
//       //         ),
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
// class _HomePageDesktopState extends State<HomePageDesktop> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Center(
//       child: Text("Desktop View"),
//     ));
//   }
// }

//----------------------------------------------------------------

// class MachineCardMobile extends StatefulWidget {
//   const MachineCardMobile({
//     super.key,
//     required this.title,
//     required this.rating,
//     required this.totalRatings,
//     required this.price,
//     required this.serviceProviderName,
//     required this.image,
//     required this.address,
//   });
//
//   final String title;
//   final double rating;
//   final int totalRatings;
//   final double price;
//   final String address;
//   final String serviceProviderName;
//   final String image;
//
//   @override
//   State<MachineCardMobile> createState() => _MachineCardMobileState();
// }
//
// class _MachineCardMobileState extends State<MachineCardMobile> {
//   @override
//   Widget build(BuildContext context) {
//     var formatter = NumberFormat('#,###');
//     var formattedPrice = formatter.format(widget.price);
//
//     return Padding(
//       padding: EdgeInsets.only(top: Dimensions.ten),
//       child: Container(
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(Dimensions.ten),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(color: Colors.black26, blurRadius: Dimensions.five)
//             ]),
//         child: Padding(
//           padding: EdgeInsets.all(Dimensions.ten),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(Dimensions.ten),
//             child: Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(Dimensions.five),
//                   child: Container(
//                       height: 210,
//                       width: 120,
//                       color: Colors.grey,
//                       child: Image.network(
//                         widget.image,
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 SizedBox(
//                   width: Dimensions.ten,
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.title,
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             height: 2),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             widget.rating.toString(),
//                             style: TextStyle(fontSize: 14),
//                           ),
//                           // SizedBox(width: 10,),
//                           // Row(
//                           //   children: [
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //   ],
//                           // ),
//                           RatingBar.builder(
//                             initialRating: widget.rating, // The rating value
//                             minRating: 1, // Minimum rating value
//                             direction: Axis
//                                 .horizontal, // The direction of the rating bar
//                             allowHalfRating:
//                                 true, // Allow half ratings (e.g., 3.5 stars)
//                             itemCount: 5, // Total number of stars
//                             itemSize: 15, // Size of each star
//                             itemBuilder: (context, _) => const Icon(
//                               Icons.star,
//                               color: Colors.orange, // Color of the filled star
//                             ),
//                             onRatingUpdate: (rating) {
//                               // Callback function when the rating is updated
//                               print(rating);
//                             },
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Text(
//                             "${widget.totalRatings} ratings",
//                             style: TextStyle(fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         widget.address,
//                         style: TextStyle(fontSize: 14, height: 1.5),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text(
//                         "Rs : ₹ ${formattedPrice} /-",
//                         style: TextStyle(fontSize: 18, height: 1.5),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Divider(),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey.shade300,
//                                 border:
//                                     Border.all(color: Colors.black38, width: 1),
//                                 borderRadius:
//                                     BorderRadius.circular(Dimensions.hundred)),
//                             // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
//                             child: Icon(
//                               Icons.person,
//                             ),
//                           ),
//                           SizedBox(
//                             width: Dimensions.ten,
//                           ),
//                           Expanded(
//                             child: Text(
//                               "Mr. Some Name",
//                               style: TextStyle(fontSize: 14),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             // child: Column(
//                             //   mainAxisAlignment: MainAxisAlignment.start,
//                             //   crossAxisAlignment: CrossAxisAlignment.start,
//                             //   children: [
//                             //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //   ],
//                             // ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: Dimensions.ten,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                               child: CustomOutlineButton(
//                             title: "Save to Later",
//                             onPressed: () {},
//                             fontSize: 12.0,
//                           )),
//                           SizedBox(
//                             width: Dimensions.ten,
//                           ),
//                           Expanded(
//                               child: CustomButton(
//                             title: "Book Now",
//                             onPressed: () {},
//                             fontSize: 12.0,
//                           ))
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//-------------------------------------------------------------

// class MachineCardTablet extends StatefulWidget {
//   const MachineCardTablet({
//     super.key,
//     required this.title,
//     required this.rating,
//     required this.totalRatings,
//     required this.price,
//     required this.serviceProviderName,
//     required this.image,
//     required this.address,
//   });
//
//   final String title;
//   final double rating;
//   final int totalRatings;
//   final double price;
//   final String address;
//   final String serviceProviderName;
//   final String image;
//
//   @override
//   State<MachineCardTablet> createState() => _MachineCardTabletState();
// }
//
// class _MachineCardTabletState extends State<MachineCardTablet> {
//   @override
//   Widget build(BuildContext context) {
//     var formatter = NumberFormat('#,###');
//     var formattedPrice = formatter.format(widget.price);
//
//     return Padding(
//       padding: EdgeInsets.only(top: Dimensions.ten),
//       child: Container(
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(Dimensions.ten),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(color: Colors.black26, blurRadius: Dimensions.five)
//             ]),
//         child: Padding(
//           padding: EdgeInsets.all(Dimensions.ten),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(Dimensions.ten),
//             child: Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(Dimensions.five),
//                   child: Container(
//                       height: 250,
//                       // width: 220,
//                       // height: (MediaQuery.of(context).size.height) / 2.5,
//                       width: (MediaQuery.of(context).size.width) / 2.5,
//                       color: Colors.grey,
//                       child: Image.network(
//                         widget.image,
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 SizedBox(
//                   width: Dimensions.ten,
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.title,
//                         style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             height: 2),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             widget.rating.toString(),
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           // SizedBox(width: 10,),
//                           // Row(
//                           //   children: [
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //   ],
//                           // ),
//                           RatingBar.builder(
//                             initialRating: widget.rating, // The rating value
//                             minRating: 1, // Minimum rating value
//                             direction: Axis
//                                 .horizontal, // The direction of the rating bar
//                             allowHalfRating:
//                                 true, // Allow half ratings (e.g., 3.5 stars)
//                             itemCount: 5, // Total number of stars
//                             itemSize: 20, // Size of each star
//                             itemBuilder: (context, _) => const Icon(
//                               Icons.star,
//                               color: Colors.orange, // Color of the filled star
//                             ),
//                             onRatingUpdate: (rating) {
//                               // Callback function when the rating is updated
//                               print(rating);
//                             },
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Text(
//                             "${widget.totalRatings} ratings",
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         widget.address,
//                         style: TextStyle(fontSize: 16, height: 1.5),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text(
//                         "Rs : ₹ ${formattedPrice} /-",
//                         style: TextStyle(fontSize: 20, height: 1.5),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Divider(),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey.shade300,
//                                 border:
//                                     Border.all(color: Colors.black38, width: 1),
//                                 borderRadius:
//                                     BorderRadius.circular(Dimensions.hundred)),
//                             // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
//                             child: Icon(
//                               Icons.person,
//                             ),
//                           ),
//                           SizedBox(
//                             width: Dimensions.ten,
//                           ),
//                           Expanded(
//                             child: Text(
//                               "Mr. Some Name",
//                               style: TextStyle(fontSize: 16),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             // child: Column(
//                             //   mainAxisAlignment: MainAxisAlignment.start,
//                             //   crossAxisAlignment: CrossAxisAlignment.start,
//                             //   children: [
//                             //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //   ],
//                             // ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: Dimensions.ten,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                               child: CustomOutlineButton(
//                             title: "Save to Later",
//                             onPressed: () {},
//                             fontSize: Dimensions.fifteen,
//                           )),
//                           SizedBox(
//                             width: Dimensions.ten,
//                           ),
//                           Expanded(
//                               child: CustomButton(
//                             title: "Book Now",
//                             onPressed: () {},
//                             fontSize: Dimensions.fifteen,
//                           ))
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//-------------------------------------------------------------

// class MachineCardDesktop extends StatefulWidget {
//   const MachineCardDesktop({
//     super.key,
//     required this.title,
//     required this.rating,
//     required this.totalRatings,
//     required this.price,
//     required this.serviceProviderName,
//     required this.image,
//     required this.address,
//   });
//
//   final String title;
//   final double rating;
//   final int totalRatings;
//   final double price;
//   final String address;
//   final String serviceProviderName;
//   final String image;
//
//   @override
//   State<MachineCardDesktop> createState() => _MachineCardDesktopState();
// }
//
// class _MachineCardDesktopState extends State<MachineCardDesktop> {
//   @override
//   Widget build(BuildContext context) {
//     var formatter = NumberFormat('#,###');
//     var formattedPrice = formatter.format(widget.price);
//
//     return Padding(
//       padding: EdgeInsets.only(top: Dimensions.ten),
//       child: Container(
//         // width: double.maxFinite,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(Dimensions.ten),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(color: Colors.black26, blurRadius: Dimensions.five)
//             ]),
//         child: Padding(
//           padding: EdgeInsets.all(Dimensions.ten),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(Dimensions.ten),
//             child: Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(Dimensions.five),
//                   child: Container(
//                       // height: 210,
//                       height: double.maxFinite,
//                       // width: 400,
//                       color: Colors.grey,
//                       child: Image.network(
//                         widget.image,
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 SizedBox(
//                   width: Dimensions.ten,
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.title,
//                         style: TextStyle(
//                             fontSize: Dimensions.thirty,
//                             fontWeight: FontWeight.bold,
//                             height: 2),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             widget.rating.toString(),
//                             style: TextStyle(fontSize: Dimensions.twenty),
//                           ),
//                           // SizedBox(width: 10,),
//                           // Row(
//                           //   children: [
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //     Icon(Icons.star,color: Colors.orange,size: 15,),
//                           //   ],
//                           // ),
//                           RatingBar.builder(
//                             initialRating: widget.rating, // The rating value
//                             minRating: 1, // Minimum rating value
//                             direction: Axis
//                                 .horizontal, // The direction of the rating bar
//                             allowHalfRating:
//                                 true, // Allow half ratings (e.g., 3.5 stars)
//                             itemCount: 5, // Total number of stars
//                             itemSize: 30, // Size of each star
//                             itemBuilder: (context, _) => const Icon(
//                               Icons.star,
//                               color: Colors.orange, // Color of the filled star
//                             ),
//                             onRatingUpdate: (rating) {
//                               // Callback function when the rating is updated
//                               print(rating);
//                             },
//                           ),
//                           SizedBox(
//                             width: 25,
//                           ),
//                           Text(
//                             "${widget.totalRatings} ratings",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         widget.address,
//                         style:
//                             TextStyle(fontSize: Dimensions.twenty, height: 1.5),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text(
//                         "Rs : ₹ ${formattedPrice} /-",
//                         style:
//                             TextStyle(fontSize: Dimensions.thirty, height: 1.5),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Divider(),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey.shade300,
//                                 border:
//                                     Border.all(color: Colors.black38, width: 1),
//                                 borderRadius:
//                                     BorderRadius.circular(Dimensions.hundred)),
//                             // child: Image.network("https://tiimg.tistatic.com/fp/1/006/403/0-5-hp-single-phase-betel-nut-cutting-machine-with-cutting-speed-of-1440rpm-067.jpg",fit: BoxFit.cover,),
//                             child: Icon(
//                               Icons.person,
//                             ),
//                           ),
//                           SizedBox(
//                             width: Dimensions.ten,
//                           ),
//                           Expanded(
//                             child: Text(
//                               "Mr. Some Name",
//                               style: TextStyle(fontSize: Dimensions.twenty),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             // child: Column(
//                             //   mainAxisAlignment: MainAxisAlignment.start,
//                             //   crossAxisAlignment: CrossAxisAlignment.start,
//                             //   children: [
//                             //     Text("Mr. Some Name",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //     Text("Experience: 8 yr",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //     Text("Machines: 4",style: TextStyle(fontSize: 8),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                             //   ],
//                             // ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: Dimensions.ten,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                               child: CustomOutlineButton(
//                             title: "Save to Later",
//                             onPressed: () {},
//                             fontSize: Dimensions.fifteen,
//                           )),
//                           SizedBox(
//                             width: Dimensions.ten,
//                           ),
//                           Expanded(
//                               child: CustomButton(
//                             title: "Book Now",
//                             onPressed: () {},
//                             fontSize: Dimensions.fifteen,
//                           ))
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
