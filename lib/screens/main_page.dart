import 'package:arecanut_app/screens/components/drawers/navigation_drawer.dart';
import 'package:arecanut_app/screens/profile/profile.dart';
import 'package:arecanut_app/screens/tabs/home.dart';
import 'package:arecanut_app/screens/tabs/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:arecanut_app/screens/search_page.dart';
import 'package:geolocator/geolocator.dart';

import '../constants/constants.dart';
import '../constants/dimensions.dart';
import 'auth/sign_in.dart';
import '../services/location_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final _searchController = TextEditingController();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // const ModelsPage(),
    // const MachinesPage(),
    // const FilamentsPage(),
    // // const ProfilePage(),
    // const VideosPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _search(String searchText) async {
    // WallpaperService wallpaperService = WallpaperService();
    // List<Wallpaper> wallpapers = await wallpaperService.getSearchedWallpapers(searchText);
    // setState(() {
    //   _wallpapers = wallpapers;
    // });
  }

  // void getLocation() async{
  //   var location = await determinePosition;
  // }

  // void printDeviceLocation() {
  //   determinePosition().then((Position position) {
  //     print('\n\nLatitude: ${position.latitude}');
  //     print('\nLongitude: ${position.longitude}');
  //   }).catchError((e) {
  //     print('Error retrieving device location: $e');
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // determinePosition;
    // printDeviceLocation();

    // print("\n\n$determinePosition");
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade700
        : Colors.white;
    var iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black87;

    return Scaffold(
      // appBar: AppBar(
      //   title: GestureDetector(
      //     onTap: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
      //     },
      //     child: Container(
      //       width: Dimensions.twoHundred,
      //       height: Dimensions.forty,
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(Dimensions.ten)
      //       ),
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: Dimensions.ten),
      //         child: const TextField(
      //           // controller: _searchController,
      //           enabled: false,
      //           cursorColor: Colors.black,
      //           decoration: InputDecoration(
      //             border: InputBorder.none,
      //             focusColor: Colors.black,
      //             hintText: 'Search here...',
      //             suffixIcon: Icon(Icons.search,color: Colors.grey,
      //               // onPressed: () => _search(_searchController.text.trim()),
      //             ),
      //           ),
      //           // onChanged: (e) => _search(_searchController.text.trim()),
      //         ),
      //       ),
      //     ),
      //   ),
      //   titleSpacing: Dimensions.five,
      //
      //   // title: Text("Logo",style: TextStyle(fontSize: Dimensions.twenty,fontWeight: FontWeight.w700),),
      //   actions: const [
      //     Chip(backgroundColor: Colors.white,label: Text("Filter"),avatar: Icon(Icons.filter_alt,color: Colors.black87,),),
      //     Chip(backgroundColor: Colors.white,avatar: Icon(Icons.language,color: Colors.black87,), label: Text(""),
      //       labelPadding: EdgeInsets.zero,)
      //     // IconButton(onPressed: (){}, icon: const Icon(Icons.headset_mic)),
      //     // TextButton(onPressed: (){
      //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
      //     // }, child: const Text("Login",style: TextStyle(color: Colors.white),)),
      //     // // IconButton(onPressed: (){}, icon: Icon(Icons.account_cirilc))
      //     // GestureDetector(
      //     //   onTap: (){
      //     //     Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(length: 0,)));
      //     //   },
      //     //   child: Padding(
      //     //     padding: EdgeInsets.only(right: Dimensions.ten),
      //     //     child: Image(
      //     //       image: AssetImage(AppIcons.profileActive),
      //     //       width: Dimensions.thirty,
      //     //       height: Dimensions.thirty,
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // ),
      // appBar: AppBar(
      //   title: Text(
      //     "Logo",
      //     style: TextStyle(
      //         fontSize: Dimensions.twenty, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => SearchPage()));
      //         },
      //         icon: Icon(
      //           Icons.search,
      //         )),
      //     // Chip(
      //     //   backgroundColor: Colors.white,
      //     //   avatar: Icon(Icons.language,color: iconColor,),
      //     //   label: Text(""),
      //     //   labelPadding: EdgeInsets.zero,
      //     // ),
      //     IconButton(
      //         onPressed: () {
      //           // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
      //         },
      //         icon: Icon(
      //           Icons.language,
      //         )),
      //     IconButton(
      //         onPressed: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => ProfilePage(length: 0)));
      //         },
      //         icon: Icon(
      //           Icons.account_circle,
      //         )),
      //   ],
      // ),
      body: HomePage(),
      // body: MachineStatusScreen(),
      // drawer: CustomDrawer(),
    );
  }
}

class MainPageForUser extends StatefulWidget {
  const MainPageForUser({Key? key}) : super(key: key);

  @override
  State<MainPageForUser> createState() => _MainPageForUserState();
}

class _MainPageForUserState extends State<MainPageForUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the Main Page for User"),
      ),
    );
  }
}
