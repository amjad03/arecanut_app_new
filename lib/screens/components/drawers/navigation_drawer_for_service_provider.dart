import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arecanut_app/constants/dimensions.dart';
import 'package:arecanut_app/screens/feedback&help/feedback.dart';
import 'package:arecanut_app/screens/search_page.dart';
import 'package:arecanut_app/screens/settings.dart';
import 'package:arecanut_app/screens/auth/sign_in.dart';
import 'package:arecanut_app/screens/policies/privacy_policy.dart';
// import 'package:arecanut_app/screens/user_features/downloads.dart';
// import 'package:arecanut_app/screens/user_features/favorites.dart';
import 'package:arecanut_app/widgets/custom_button.dart';

import '../../../repository/auth_repository.dart';
import '../../../widgets/show_dialogue.dart';
import '../../../widgets/show_message.dart';
import '../../main_page.dart';
import '../../feedback&help/help.dart';
import '../../main_page_for_provider.dart';
import '../../policies/about.dart';
import 'package:firebase_auth/firebase_auth.dart';



class CustomDrawerForServiceProvider extends StatefulWidget {
  const CustomDrawerForServiceProvider({Key? key}) : super(key: key);

  @override
  State<CustomDrawerForServiceProvider> createState() => _CustomDrawerForServiceProviderState();
}

class _CustomDrawerForServiceProviderState extends State<CustomDrawerForServiceProvider> {

  late String _selected;
  String? name = '';
  String? email = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  @override
  void initState() {
    super.initState();
    _selected = 'images';
    getUserData();
  }

  void getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name');
    email = prefs.getString('email');
  }



  @override
  Widget build(BuildContext context) {

    var color = Theme.of(context).brightness == Brightness.dark ? const Color(0xFF333333) : Colors.white;
    var selectedColor = Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.black;

    final loggedIn = checkLoggedIn();
    // final FirebaseAuth auth = FirebaseAuth.instance;

    goToMainPage(){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainPageForProvider()), (Route<dynamic> route) => false);
    }

    Future<void> logOutForServiceProvider(BuildContext context, goToMainPage) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Do you want to logout ?'),
            content: const Text("You have to login again in order to use the app's features",textAlign: TextAlign.center,),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Cancel',style: TextStyle(color: Colors.grey),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Confirm',style: TextStyle(color: Colors.grey),),
                    onPressed: () {
                      logOut();
                      Navigator.of(context).pop();
                      goToMainPage;
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainPageForProvider()), (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    }



    return Drawer(
      backgroundColor: color,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage('https://images.pexels.com/photos/5409751/pexels-photo-5409751.jpeg?auto=compress&cs=tinysrgb&w=600'),
                    fit: BoxFit.cover,
                  )
              ), //BoxDecoration
              child: Container(
                child: loggedIn ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: Dimensions.thirty,
                      child: Icon(Icons.person,size: Dimensions.forty,color: Colors.grey,),
                    ),
                    SizedBox(width: Dimensions.fifteen,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(currentUser?.displayName ?? '',style: TextStyle(fontSize: Dimensions.twenty,color: Colors.white),),
                        Text(currentUser?.email ?? '',style: TextStyle(fontSize: Dimensions.fifteen,color: Colors.white,fontWeight: FontWeight.w300),)
                      ],
                    )
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: Dimensions.thirty,
                      child: Icon(Icons.person,size: Dimensions.forty,color: Colors.grey,),
                    ),
                    SizedBox(width: Dimensions.fifteen,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customRoundedButton('Login', Icons.login, onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                        })
                      ],
                    )
                  ],
                ),
              )
          ),
          // ListTile(
          //   selected: _selected == 'downloads' ? true : false,
          //   selectedColor: selectedColor,
          //   leading: FaIcon(FontAwesomeIcons.download,size: Dimensions.twenty,),
          //   title: const Text('Downloads'),
          //   onTap: () {
          //     // setState(() {
          //     //   _selected = 'downloads';
          //     // });
          //     // loggedIn ? Navigator.push(context, MaterialPageRoute(builder: (context) => const DownloadsScreen()))
          //     //     : showToast("You are not logged in");
          //   },
          // ),
          ListTile(
            selected: _selected == 'settings' ? true : false,
            selectedColor: selectedColor,
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              setState(() {
                _selected = 'settings';
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            selected: _selected == 'about' ? true : false,
            selectedColor: selectedColor,
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              setState(() {
                _selected = 'about';
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
          // const Divider(color: Colors.grey,),
          ListTile(
            selected: _selected == 'help' ? true : false,
            selectedColor: selectedColor,
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              setState(() {
                _selected = 'help';
              });
              loggedIn ? Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()))
                  : showToast("You are not logged in");
            },
          ),
          ListTile(
            selected: _selected == 'feedback' ? true : false,
            selectedColor: selectedColor,
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {
              setState(() {
                _selected = 'feedback';
              });
              loggedIn ? Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackScreen()))
                  : showToast("You are not logged in");
            },
          ),
          ListTile(
            selected: _selected == 'privacy' ? true : false,
            selectedColor: selectedColor,
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy & Policy'),
            onTap: () {
              setState(() {
                _selected = 'privacy';
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
            },
          ),
          ListTile(
            selected: _selected == 'logout' ? true : false,
            selectedColor: selectedColor,
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              setState(() {
                _selected = 'logout';
              });
              // loggedIn ? logout(context)
              //     : showToast("You are not logged in");
              loggedIn ? logOutForServiceProvider(context,goToMainPage())
                  : showToast("You are not logged in");
            },
          ),
        ],
      ),
    );
  }
}
