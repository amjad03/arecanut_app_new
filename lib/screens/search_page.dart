import 'package:arecanut_app/screens/search_page/search_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../constants/dimensions.dart';
import '../services/data_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  bool isLoading = false;

  List result = [];

  void _search(String searchText) async {
    // DataService dataService = DataService();
    // List _result = await dataService.getSearchResult(searchText);
    // setState(() {
    //   result = _result;
    //   isLoading = false;
    // });
  }

  // void _load(){
  //
  // }

  @override
  void initState() {
    super.initState();
    // _load();
    setState(() {
      isLoading = true;
    });
    _search("DEX N");
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    var bgColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade700
        : Colors.white;

    return ScreenTypeLayout.builder(
      mobile: (_) => SearchPageDesktop(),
      tablet: (_) => SearchPageDesktop(),
      desktop: (_) => SearchPageDesktop(),
    );

    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: Container(
    //   //     // width: Dimensions.twoHundred,
    //   //     decoration: BoxDecoration(
    //   //         color: Colors.white,
    //   //         borderRadius: BorderRadius.circular(Dimensions.ten)
    //   //     ),
    //   //     child: Padding(
    //   //       padding: EdgeInsets.symmetric(horizontal: Dimensions.ten),
    //   //       child: TextField(
    //   //         controller: _searchController,
    //   //         enabled: false,
    //   //         cursorColor: Colors.black,
    //   //         decoration: InputDecoration(
    //   //           border: InputBorder.none,
    //   //           focusColor: Colors.black,
    //   //           hintText: 'Search here...',
    //   //           suffixIcon: IconButton(
    //   //             icon: const Icon(Icons.search,color: Colors.grey,),
    //   //             onPressed: () => _search(_searchController.text.trim()),
    //   //           ),
    //   //         ),
    //   //         onChanged: (e) => _search(_searchController.text.trim()),
    //   //       ),
    //   //     ),
    //   //   ),
    //   // ),
    //   appBar: AppBar(
    //     title: GestureDetector(
    //       onTap: () {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => const SearchPage()));
    //       },
    //       child: Container(
    //         width: double.maxFinite,
    //         height: 40,
    //         decoration: BoxDecoration(
    //             color: bgColor,
    //             borderRadius: BorderRadius.circular(Dimensions.ten)),
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: Dimensions.ten),
    //           child: const TextField(
    //             // controller: _searchController,
    //             cursorColor: Colors.black,
    //             decoration: InputDecoration(
    //               border: InputBorder.none,
    //               focusColor: Colors.black,
    //               hintText: 'Search here...',
    //               suffixIcon: Icon(
    //                 Icons.search, color: Colors.grey,
    //                 // onPressed: () => _search(_searchController.text.trim()),
    //               ),
    //             ),
    //             // onChanged: (e) => _search(_searchController.text.trim()),
    //           ),
    //         ),
    //       ),
    //     ),
    //     titleSpacing: Dimensions.five,
    //
    //     // title: Text("Logo",style: TextStyle(fontSize: Dimensions.twenty,fontWeight: FontWeight.w700),),
    //     actions: [
    //       Padding(
    //         padding: EdgeInsets.all(Dimensions.ten),
    //         child: const Chip(
    //           backgroundColor: Colors.white,
    //           label: Text("Filter"),
    //           avatar: Icon(
    //             Icons.filter_alt,
    //             color: Colors.black87,
    //           ),
    //         ),
    //       ),
    //       // Chip(backgroundColor: Colors.white,avatar: Icon(Icons.language,color: Colors.black87,), label: Text(""),
    //       //   labelPadding: EdgeInsets.zero,)
    //       // IconButton(onPressed: (){}, icon: const Icon(Icons.headset_mic)),
    //       // TextButton(onPressed: (){
    //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
    //       // }, child: const Text("Login",style: TextStyle(color: Colors.white),)),
    //       // // IconButton(onPressed: (){}, icon: Icon(Icons.account_cirilc))
    //       // GestureDetector(
    //       //   onTap: (){
    //       //     Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(length: 0,)));
    //       //   },
    //       //   child: Padding(
    //       //     padding: EdgeInsets.only(right: Dimensions.ten),
    //       //     child: Image(
    //       //       image: AssetImage(AppIcons.profileActive),
    //       //       width: Dimensions.thirty,
    //       //       height: Dimensions.thirty,
    //       //     ),
    //       //   ),
    //       // ),
    //     ],
    //   ),
    //   body: Stack(
    //     children: [
    //       isLoading
    //           ? SizedBox(
    //               width: double.infinity,
    //               height: double.infinity,
    //               child: Center(
    //                 child: CircularProgressIndicator(
    //                   color: color,
    //                 ),
    //               ),
    //             )
    //           : Container(),
    //       // !isLoading ?
    //       // ListView.builder(
    //       //   itemCount: result.length,
    //       //   itemBuilder: (context, index) => Padding(
    //       //     padding: EdgeInsets.all(Dimensions.ten),
    //       //     child: Container(
    //       //       decoration: BoxDecoration(
    //       //           borderRadius: BorderRadius.circular(Dimensions.ten),
    //       //           boxShadow: [
    //       //             BoxShadow(
    //       //                 color: Colors.black38,
    //       //                 blurRadius: Dimensions.five
    //       //             )
    //       //           ]
    //       //       ),
    //       //       child: ClipRRect(
    //       //         borderRadius: BorderRadius.circular(Dimensions.ten),
    //       //         child: Container(
    //       //           decoration: BoxDecoration(
    //       //             borderRadius: BorderRadius.circular(10),
    //       //             color: Colors.white,
    //       //           ),
    //       //           child: Row(
    //       //             children: [
    //       //               SizedBox(
    //       //                 width: Dimensions.hundred,
    //       //                 child: Image.network(
    //       //                   result[index]['displayImage']
    //       //                 ),
    //       //               )
    //       //             ],
    //       //           ),
    //       //         ),
    //       //       ),
    //       //     ),
    //       //   ),
    //       // )
    //       // : Container()
    //     ],
    //   ),
    // );
  }
}
