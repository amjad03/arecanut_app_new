// import 'package:arecanut_app/screens/components/drawers/navigation_drawer.dart';
// import 'package:flutter/material.dart';
//
// import '../../constants/dimensions.dart';
//
// class SearchPageDesktop extends StatefulWidget {
//   const SearchPageDesktop({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPageDesktop> createState() => _SearchPageDesktopState();
// }
//
// class _SearchPageDesktopState extends State<SearchPageDesktop> {
//   final _searchController = TextEditingController();
//   bool isLoading = false;
//
//   List result = [];
//
//   void _search(String searchText) async {
//     // DataService dataService = DataService();
//     // List _result = await dataService.getSearchResult(searchText);
//     // setState(() {
//     //   result = _result;
//     //   isLoading = false;
//     // });
//   }
//
//   // void _load(){
//   //
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     // _load();
//     setState(() {
//       isLoading = true;
//     });
//     _search("DEX N");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var color = Theme.of(context).brightness == Brightness.dark
//         ? Colors.white
//         : Colors.black;
//     var bgColor = Theme.of(context).brightness == Brightness.dark
//         ? Colors.grey.shade700
//         : Colors.white;
//
//     // print(result[0]);
//
//     return Scaffold(
//       extendBodyBehindAppBar: false,
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               "Logo",
//               style: TextStyle(
//                   fontSize: Dimensions.twenty, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               width: 40,
//             ),
//             Expanded(
//               child: Container(
//                 width: double.maxFinite,
//                 height: 40,
//                 decoration: BoxDecoration(
//                     color: bgColor,
//                     borderRadius: BorderRadius.circular(Dimensions.ten)),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: Dimensions.ten),
//                   child: const TextField(
//                     // controller: _searchController,
//                     cursorColor: Colors.black,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusColor: Colors.black,
//                       hintText: 'Search here...',
//                       suffixIcon: Icon(
//                         Icons.search, color: Colors.grey,
//                         // onPressed: () => _search(_searchController.text.trim()),
//                       ),
//                     ),
//                     // onChanged: (e) => _search(_searchController.text.trim()),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // titleSpacing: Dimensions.five,
//
//         // title: Text("Logo",style: TextStyle(fontSize: Dimensions.twenty,fontWeight: FontWeight.w700),),
//         actions: [
//           Padding(
//             padding: EdgeInsets.all(Dimensions.ten),
//             child: const Chip(
//               backgroundColor: Colors.white,
//               label: Text("Filter"),
//               avatar: Icon(
//                 Icons.filter_alt,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//           // Chip(backgroundColor: Colors.white,avatar: Icon(Icons.language,color: Colors.black87,), label: Text(""),
//           //   labelPadding: EdgeInsets.zero,)
//           // IconButton(onPressed: (){}, icon: const Icon(Icons.headset_mic)),
//           // TextButton(onPressed: (){
//           //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
//           // }, child: const Text("Login",style: TextStyle(color: Colors.white),)),
//           // // IconButton(onPressed: (){}, icon: Icon(Icons.account_cirilc))
//           // GestureDetector(
//           //   onTap: (){
//           //     Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(length: 0,)));
//           //   },
//           //   child: Padding(
//           //     padding: EdgeInsets.only(right: Dimensions.ten),
//           //     child: Image(
//           //       image: AssetImage(AppIcons.profileActive),
//           //       width: Dimensions.thirty,
//           //       height: Dimensions.thirty,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//       body: Row(
//         children: [
//           Container(
//               // margin: EdgeInsets.only(top: 50),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(color: Colors.black38, blurRadius: 10),
//                 ],
//               ),
//               // width: 320,
//               child: CustomDrawer()),
//           // Expanded(
//           //   child: Column(
//           //     children: [
//           //       isLoading
//           //           ? SizedBox(
//           //               width: double.infinity,
//           //               height: double.infinity,
//           //               child: Center(
//           //                 child: CircularProgressIndicator(
//           //                   color: color,
//           //                 ),
//           //               ),
//           //             )
//           //           : Container(),
//           //       // !isLoading ?
//           //       // ListView.builder(
//           //       //   itemCount: result.length,
//           //       //   itemBuilder: (context, index) => Padding(
//           //       //     padding: EdgeInsets.all(Dimensions.ten),
//           //       //     child: Container(
//           //       //       decoration: BoxDecoration(
//           //       //           borderRadius: BorderRadius.circular(Dimensions.ten),
//           //       //           boxShadow: [
//           //       //             BoxShadow(
//           //       //                 color: Colors.black38,
//           //       //                 blurRadius: Dimensions.five
//           //       //             )
//           //       //           ]
//           //       //       ),
//           //       //       child: ClipRRect(
//           //       //         borderRadius: BorderRadius.circular(Dimensions.ten),
//           //       //         child: Container(
//           //       //           decoration: BoxDecoration(
//           //       //             borderRadius: BorderRadius.circular(10),
//           //       //             color: Colors.white,
//           //       //           ),
//           //       //           child: Row(
//           //       //             children: [
//           //       //               SizedBox(
//           //       //                 width: Dimensions.hundred,
//           //       //                 child: Image.network(
//           //       //                   result[index]['displayImage']
//           //       //                 ),
//           //       //               )
//           //       //             ],
//           //       //           ),
//           //       //         ),
//           //       //       ),
//           //       //     ),
//           //       //   ),
//           //       // )
//           //       // : Container()
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
//
// void main() => runApp(SearchBarApp());
//
// class SearchBarApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Search Bar with Filter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SearchPageDesktop(),
//     );
//   }
// }

class SearchPageDesktop extends StatefulWidget {
  @override
  _SearchPageDesktopState createState() => _SearchPageDesktopState();
}

class _SearchPageDesktopState extends State<SearchPageDesktop> {
  _SearchPageDesktopState() {
    _selectedFilter = items[0];
  }

  TextEditingController _searchController = TextEditingController();

  final items = <String>[
    'Filter 1',
    'Filter 2',
    'Filter 3',
    'Filter 4',
  ];

  String _selectedFilter = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Bar with Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Filter:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: _selectedFilter,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFilter = newValue!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Search Result:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // Display your search result here
            Text('Placeholder for search result'),
          ],
        ),
      ),
    );
  }
}
