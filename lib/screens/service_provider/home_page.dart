import 'package:arecanut_app/constants/constants.dart';
import 'package:arecanut_app/constants/dimensions.dart';
import 'package:flutter/material.dart';

class HomePageForProvider extends StatefulWidget {
  const HomePageForProvider({Key? key}) : super(key: key);

  @override
  State<HomePageForProvider> createState() => _HomePageForProviderState();
}

class _HomePageForProviderState extends State<HomePageForProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.fifteen),
          child: Column(
            children: [
              // DashboardCard(
              //   title: 'Machines Serviced',
              //   value: '25',
              //   icon: Icons.inventory_outlined,
              //   // color: Colors.green,
              // ),
              // DashboardCard(
              //   title: 'Pending Requests',
              //   value: '8',
              //   icon: Icons.inventory_outlined,
              //   // color: Colors.orange,
              // ),
              // DashboardCard(
              //   title: 'Upcoming Appointments',
              //   value: '3',
              //   icon: Icons.inventory_outlined,
              //   // color: Colors.blue,
              // ),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: Dimensions.twenty,
                  crossAxisSpacing: Dimensions.twenty,
                ),
                children: const [
                  DashboardCard(
                    title: 'Machines Serviced',
                    value: '25',
                    icon: Icons.inventory_outlined,
                  ),
                  DashboardCard(
                    title: 'Pending Requests',
                    value: '8',
                    icon: Icons.pending,
                  ),
                  DashboardCard(
                    title: 'Upcoming Appointments',
                    value: '3',
                    icon: Icons.notifications_active,
                  ),
                  DashboardCard(
                    title: 'Cancelled',
                    value: '1',
                    icon: Icons.cancel,
                    // color: Colors.purple,
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     DashboardCard(
              //       title: 'Machines Serviced',
              //       value: '25',
              //       color: Colors.green,
              //     ),
              //     DashboardCard(
              //       title: 'Pending Requests',
              //       value: '8',
              //       color: Colors.orange,
              //     ),
              //   ],
              // ),
              // SizedBox(height: 16.0),
              // DashboardCard(
              //   title: 'Upcoming Appointments',
              //   value: '3',
              //   icon: Icons.inventory_outlined,
              //   // color: Colors.blue,
              // ),
              // SizedBox(height: 16.0),
              // DashboardCard(
              //   title: 'Revenue',
              //   value: '\$12,500',
              //   icon: Icons.inventory_outlined,
              //   // color: Colors.purple,
              // ),
              // DashboardCard(
              //   title: 'Machines Serviced',
              //   value: '25', // Replace with actual data
              // ),
              // DashboardCard(
              //   title: 'Pending Requests',
              //   value: '8', // Replace with actual data
              // ),
              // DashboardCard(
              //   title: 'Upcoming Appointments',
              //   value: '3', // Replace with actual data
              // ),
              // DashboardCard(title: title, value: value, icon: icon)
            ],
          ),
        ),
      ),
    );
  }
}

// class DashboardCard extends StatelessWidget {
//   final String title;
//   final String value;
//
//   const DashboardCard({super.key, required this.title, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         gradient: LinearGradient(
//           colors: [
//             AppColors.blue,
//             Colors.white
//           ]
//         ),
//         borderRadius: BorderRadius.circular(Dimensions.ten),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black38,
//             blurRadius: Dimensions.five
//           )
//         ]
//       ),
//       margin: EdgeInsets.all(Dimensions.fifteen),
//       child: Padding(
//         padding: EdgeInsets.all(Dimensions.fifteen),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: Dimensions.fifteen,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: Dimensions.ten),
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: Dimensions.twenty,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  // final Color color;
  final IconData icon;

  const DashboardCard({super.key,
    required this.title,
    required this.value,
    // required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.fifteen),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
              blurRadius: Dimensions.five
            )
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.fifteen),
        child: Container(
          // width: 170,
          height: Dimensions.hundred,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icon,size: Dimensions.sixty, color: AppColors.blue,),
                    SizedBox(width: Dimensions.twenty,),
                    Text(value, style: TextStyle(color: AppColors.blue, fontSize: Dimensions.thirty),overflow: TextOverflow.ellipsis,)
                  ],
                ),
              ),
              Container(
                height: Dimensions.sixty,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: AppColors.blue,
                  color: Color(0xff004c90),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     AppColors.blue,
                  //     Colors.white
                  //   ],
                  // )
                ),
                child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: Dimensions.eighteen),textAlign: TextAlign.center,)),
              )
            ],
          ),
        ),
      ),
    );
    // return Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //   ),
    //   color: color,
    //   child: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           title,
    //           style: TextStyle(
    //             fontSize: 16.0,
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white,
    //           ),
    //         ),
    //         SizedBox(height: 8.0),
    //         Text(
    //           value,
    //           style: TextStyle(
    //             fontSize: 24.0,
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}


