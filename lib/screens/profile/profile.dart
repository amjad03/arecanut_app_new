import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arecanut_app/constants/dimensions.dart';
import 'package:arecanut_app/screens/settings.dart';
import 'package:arecanut_app/screens/auth/sign_in.dart';
import 'package:arecanut_app/screens/profile/edit_profile.dart';

import '../../constants/constants.dart';
import '../../repository/auth_repository.dart';
// import '../../services/shared_preference_service.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/show_dialogue.dart';
import '../../widgets/show_message.dart';
import '../feedback&help/feedback.dart';
import '../main_page.dart';
// import '../wallpaper_detailed_screen.dart';
import '../feedback&help/help.dart';
import '../policies/privacy_policy.dart';
// import '../user_features/downloads.dart';
// import '../user_features/favorites.dart';
// import '../user_features/shared.dart';

// void removeFromRecentlyViewed(id) async{
//   DeleteWallpaperHandler deleteWallpaperHandler = DeleteWallpaperHandler();
//   deleteWallpaperHandler.removeWallpaperFromRecentlyViewed(id);
// }

bool noData = false;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.length}) : super(key: key);

  final int length;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List _randomColor = [];
  late Color color;

  void _setRandomColor() {
    for (var i = 1; i <= 20; i++) {
      setState(() {
        final random = Random();
        color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );
        _randomColor.add(color);
      });
    }
  }

  Map<String, String> result = {};

  Future<Map<String, String>> getFromFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> favorites =
        jsonDecode(prefs.getString('data') ?? '{}');

    setState(() {
      favorites.forEach((key, value) {
        result[key] = value.toString();
      });
    });

    return result;
  }

  var lenFavorites = 0;
  var lenDownloads = 0;
  var lenShared = 0;
  var lenRecentlyViewed = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  String userName = 'UserName';
  String userEmail = '';

  // void getLength() async {
  //   int lengthFav = await getSharedPrefsListLength('favorites');
  //   int lengthDownloads = await getSharedPrefsListLength('downloaded');
  //   int lengthShared = await getSharedPrefsListLength('shared');
  //   int lengthRecentlyViewed = await getSharedPrefsListLength('recentlyViewed');
  //
  //   // if(lengthRecentlyViewed == 0){
  //   //   setState(() {
  //   //     noData = true;
  //   //   });
  //   // }
  //
  //   setState(() {
  //     lenFavorites = lengthFav;
  //     lenDownloads = lengthDownloads;
  //     lenShared = lengthShared;
  //     lenRecentlyViewed = lengthRecentlyViewed;
  //   });
  // }

  // Future<int> getLengthOfRecentlyViewed() async {
  //   int lengthRecentlyViewed = await getSharedPrefsListLength('recentlyViewed');
  //   return lengthRecentlyViewed;
  // }

  // String? name = 'User Name';
  // String? email = 'user.email@gmail.com';
  //
  // void getUserData()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   name = prefs.getString('name');
  //   email = prefs.getString('email');
  // }

  @override
  void initState() {
    super.initState();
    _setRandomColor();
    getFromFavorites();
    getUserNameAndEmail();
  }

  Future<void> getUserNameAndEmail() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // name = prefs.getString('name');
    // email = prefs.getString('email');

    final userData = await getUserData();
    userName = userData['name']!;
    userEmail = userData['email']!;
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // User? get currentUser => _auth.currentUser;

  @override
  Widget build(BuildContext context) {
    final loggedIn = checkLoggedIn();

    var bgColor = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF333333)
        : Colors.white;
    var color = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade700
        : Colors.grey.shade200;

    goToMainPage() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainPage()),
          (Route<dynamic> route) => false);
    }

    Future<void> deleteHistory(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Do you want to delete history?'),
            content: const Text(
              "You will loose the images which you have viewed recently",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      // DeleteWallpaperHandler deleteWallpaperHandler = DeleteWallpaperHandler();
                      // deleteWallpaperHandler.clearRecentlyViewedList();
                      // Navigator.of(context).pop();
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(builder: (context) => const MainPage()),
                      //         (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    // var lengthRecentlyViewed = getLengthOfRecentlyViewed();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: 'Inter'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimensions.twenty),
          width: double.maxFinite,
          child: !loggedIn
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.person,
                                size: Dimensions.fifty,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customRoundedButton('Login', Icons.login,
                                onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()));
                            })
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.width20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Divider(
                      color: AppColors.grey,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Why Choose Us :",
                            style: TextStyle(
                                fontSize: Dimensions.fifteen,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.fifteen,
                        ),
                        featuredPoints('Expertise in this sector'),
                        featuredPoints('Quality Service'),
                        featuredPoints('Genuine Price'),
                        featuredPoints('Cost-effective Solutions'),
                        featuredPoints('Customer Satisfaction'),
                        featuredPoints('Flexibility'),
                      ],
                    ),
                    Divider(
                      color: AppColors.grey,
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.ten),
                      // decoration: BoxDecoration(
                      //   color: color,
                      //   borderRadius:
                      //       BorderRadius.circular(Dimensions.radius12),
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.grey.withOpacity(0.5),
                      //       spreadRadius: 2,
                      //       blurRadius: 5,
                      //       offset: const Offset(0, 3),
                      //     ),
                      //   ],
                      // ),
                      child: Column(
                        children: [
                          customListTiles(
                              const FaIcon(FontAwesomeIcons.solidHeart),
                              "Favorites",
                              true, () {
                            showToast("Your are not Logged in");
                          }, color),
                          // customListTiles(
                          //     const FaIcon(FontAwesomeIcons.download),
                          //     "Downloads",
                          //     true, () {
                          //   showToast("Your are not Logged in");
                          // }),
                          // customListTiles(const FaIcon(FontAwesomeIcons.share),
                          //     "Shared", true, () {
                          //   showToast("Your are not Logged in");
                          // }),
                          customListTiles(
                              const FaIcon(FontAwesomeIcons.message),
                              "Feedback",
                              false, () {
                            showToast("Your are not Logged in");
                          }, color),
                          customListTiles(
                              const FaIcon(FontAwesomeIcons.circleQuestion),
                              "Help",
                              false, () {
                            showToast("Your are not Logged in");
                          }, color),
                          customListTiles(const FaIcon(FontAwesomeIcons.shield),
                              "Privacy & Policy", false, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPolicy()));
                          }, color),
                          customListTiles(const FaIcon(FontAwesomeIcons.lock),
                              "Terms & Conditions", false, () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const TermsAndConditions()
                            //     )
                            // );
                          }, color),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                              color: Colors.orange, shape: BoxShape.circle),
                          child: Align(
                              alignment: Alignment.center,
                              // child: Text(currentUser?.displayName?.toString().substring(0,1) ?? 'U',style: TextStyle(fontSize: Dimensions.thirty,color: Colors.white),)),
                              child: Text(
                                // currentUser?.displayName.toString()[0] ?? 'U',
                                userName[0],
                                style: TextStyle(
                                    fontSize: Dimensions.thirty,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text("currentUser?.displayName ?? ''",style: TextStyle(fontSize: Dimensions.twenty,fontFamily: 'Inter'),),
                            // Text("currentUser?.email ?? ''",style: TextStyle(fontSize: Dimensions.fifteen,fontFamily: 'Inter'),),
                            Text(
                              // currentUser?.displayName ?? "User Name",
                              userName,
                              style: TextStyle(
                                  fontSize: Dimensions.twenty,
                                  fontFamily: 'Inter'),
                            ),
                            Text(
                              // currentUser?.email ?? "user_email@gmail.com",
                              userEmail,
                              style: TextStyle(
                                  fontSize: Dimensions.fifteen,
                                  fontFamily: 'Inter'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.width20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customRoundedButton('Logout', Icons.logout,
                            onPressed: () {
                          // logout(context);
                          logOutDialogBox(context, goToMainPage());
                        }),
                        customRoundedButton('Edit Profile', Icons.edit,
                            onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.grey,
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.ten),
                      // decoration: BoxDecoration(
                      //   color: color,
                      //   borderRadius:
                      //       BorderRadius.circular(Dimensions.radius12),
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.grey.withOpacity(0.5),
                      //       spreadRadius: 2,
                      //       blurRadius: 5,
                      //       offset: const Offset(0, 3),
                      //     ),
                      //   ],
                      // ),
                      child: Column(
                        children: [
                          customListTiles(
                              const FaIcon(FontAwesomeIcons.solidHeart),
                              "Favorites",
                              true, () {
                            showToast("Your are not Logged in");
                          }, color),
                          // customListTiles(
                          //     const FaIcon(FontAwesomeIcons.download),
                          //     "Downloads",
                          //     true, () {
                          //   showToast("Your are not Logged in");
                          // }),
                          // customListTiles(const FaIcon(FontAwesomeIcons.share),
                          //     "Shared", true, () {
                          //   showToast("Your are not Logged in");
                          // }),
                          customListTiles(
                              const FaIcon(FontAwesomeIcons.message),
                              "Feedback",
                              false, () {
                            showToast("Your are not Logged in");
                          }, color),
                          customListTiles(
                              const FaIcon(FontAwesomeIcons.circleQuestion),
                              "Help",
                              false, () {
                            showToast("Your are not Logged in");
                          }, color),
                          customListTiles(const FaIcon(FontAwesomeIcons.shield),
                              "Privacy & Policy", false, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPolicy()));
                          }, color),
                          customListTiles(const FaIcon(FontAwesomeIcons.lock),
                              "Terms & Conditions", false, () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const TermsAndConditions()
                            //     )
                            // );
                          }, color),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  featuredPoints(String title) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.circle_rounded,
            size: Dimensions.ten,
          ),
          SizedBox(
            width: Dimensions.fifteen,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: Dimensions.fifteen, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  customListTile(FaIcon icon, String title, bool keep, String total, ontap) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          title: Text(title),
          leading: icon,
          trailing: keep
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      total,
                      style: TextStyle(fontSize: Dimensions.fifteen),
                    ),
                    SizedBox(
                      width: Dimensions.ten,
                    ),
                    const Icon(Icons.chevron_right_rounded)
                  ],
                )
              : const Icon(Icons.chevron_right_rounded),
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
        ),
      ],
    );
  }

  customListTiles(FaIcon icon, String title, bool keep, ontap, color) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.grey.shade200,
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              onTap: ontap,
              title: Text(title),
              leading: icon,
              trailing: keep
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "-",
                          style: TextStyle(fontSize: Dimensions.twenty),
                        ),
                        SizedBox(
                          width: Dimensions.ten,
                        ),
                        const Icon(Icons.chevron_right_rounded)
                      ],
                    )
                  : const Icon(Icons.chevron_right_rounded),
            ),
            // const Divider(
            //   height: 0,
            //   color: Colors.grey,
            // ),
          ],
        ),
      ),
    );
  }
}

class RecentlyViewedList extends StatefulWidget {
  const RecentlyViewedList({Key? key}) : super(key: key);

  @override
  State<RecentlyViewedList> createState() => _RecentlyViewedListState();
}

class _RecentlyViewedListState extends State<RecentlyViewedList> {
  // late Stream<List<Wallpaper>> _recentlyViewedStream;
  // late GetWallpaperHandler _getWallpaperHandler;

  final loggedIn = checkLoggedIn();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    // _getWallpaperHandler = GetWallpaperHandler();
    // _recentlyViewedStream = _getWallpaperHandler.getRecentlyViewedStream();
  }

  final random = Random();
  @override
  Widget build(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    return Stack(children: [
      // StreamBuilder<List<Wallpaper>>(
      //   stream: _recentlyViewedStream,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     }
      //
      //     if(snapshot.hasData) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         setState(() {
      //           isLoading = false;
      //         });
      //         return SizedBox(
      //           width: double.maxFinite,
      //           height: Dimensions.hundred,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               const CircularProgressIndicator(color: Colors.grey,),
      //               SizedBox(height: Dimensions.thirty,),
      //               const Text('Loading...'),
      //             ],
      //           ),
      //         );
      //       }
      //
      //       final wallpapers = snapshot.data!;
      //       return GridView.builder(
      //           shrinkWrap: true,
      //           scrollDirection: Axis.horizontal,
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             childAspectRatio: 4/2.5,
      //             crossAxisCount: 1,
      //             crossAxisSpacing: Dimensions.ten,
      //             mainAxisSpacing: Dimensions.ten,
      //           ),
      //           itemCount: wallpapers.length,
      //           itemBuilder: (context, index) {
      //             final wallpaper = wallpapers.reversed.toList()[index];
      //             return GestureDetector(
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) =>
      //                           WallpaperDetailScreen(
      //                             imageUrl: wallpaper.imageUrl,
      //                             wallpapers: wallpapers,
      //                             index: index,
      //                           ),
      //                     )
      //                 );
      //                 Ads.showInterstitialAd();
      //               },
      //               child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(Dimensions.fifteen),
      //                   child: Stack(
      //                     fit: StackFit.expand,
      //                       children: [
      //                         Container(
      //                             color: Color.fromRGBO(
      //                               random.nextInt(256),
      //                               random.nextInt(256),
      //                               random.nextInt(256),
      //                               1,
      //                             ),
      //                             child: CachedNetworkImage(
      //                               imageUrl: wallpaper.imageUrl,
      //                               fit: BoxFit.cover,
      //                               errorWidget: (BuildContext context, String error, dynamic _) {
      //                                 return Container(
      //                                   color: Color.fromRGBO(
      //                                     random.nextInt(256),
      //                                     random.nextInt(256),
      //                                     random.nextInt(256),
      //                                     1,
      //                                   ),
      //                                   child: const Center(
      //                                     child: Text("Error loading image"),
      //                                   ),
      //                                 );
      //                               },
      //                               placeholder: (BuildContext context, String url) {
      //                                 return Container(
      //                                   color: Color.fromRGBO(
      //                                     random.nextInt(256),
      //                                     random.nextInt(256),
      //                                     random.nextInt(256),
      //                                     1,
      //                                   ),
      //                                   child: const Center(
      //                                     child: CircularProgressIndicator(),
      //                                   ),
      //                                 );
      //                               },
      //                             )
      //                             // Image.network(
      //                             //   wallpaper.imageUrl,
      //                             //   fit: BoxFit.cover,
      //                             //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
      //                             //     return Container(
      //                             //       color: Color.fromRGBO(
      //                             //         random.nextInt(256),
      //                             //         random.nextInt(256),
      //                             //         random.nextInt(256),
      //                             //         1,
      //                             //       ),
      //                             //       child: const Center(
      //                             //         child: Text("Loading..."),
      //                             //       ),
      //                             //     );
      //                             //   },
      //                             // )
      //                         ),
      //                         // Align(
      //                         //   alignment: Alignment.topRight,
      //                         //   child: GestureDetector(
      //                         //       onTap: () async {
      //                         //         if(loggedIn){
      //                         //           removeFromRecentlyViewed(wallpaper.id);
      //                         //           setState(() {
      //                         //
      //                         //           });
      //                         //         }else{
      //                         //           showToast('You are not logged in');
      //                         //         }
      //                         //       },
      //                         //       child: const Icon(Icons.delete,color: Colors.white,)
      //                         //   ),
      //                         // )
      //                       ]
      //                   )
      //
      //               ),
      //
      //             );
      //           });
      //     }
      //     else{
      //       return const Center(
      //         child: Text("No Wallpapers viewed yet..."),
      //       );
      //     }
      //   },
      // ),
      if (isLoading)
        const Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        )
    ]);
  }
}
