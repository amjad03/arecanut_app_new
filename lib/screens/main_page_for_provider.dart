import 'package:arecanut_app/screens/profile/profile.dart';
import 'package:arecanut_app/screens/service_provider/home_page.dart';
import 'package:flutter/material.dart';

import '../constants/dimensions.dart';
import 'components/drawers/navigation_drawer.dart';
import 'components/drawers/navigation_drawer_for_service_provider.dart';

class MainPageForProvider extends StatefulWidget {
  const MainPageForProvider({Key? key}) : super(key: key);

  @override
  State<MainPageForProvider> createState() => _MainPageForProviderState();
}

class _MainPageForProviderState extends State<MainPageForProvider> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade700 : Colors.white;
    var iconColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        title: Text("Logo",style: TextStyle(fontSize: Dimensions.twenty, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
              onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: Icon(Icons.language,)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(length: 0)));
              },
              icon: Icon(Icons.account_circle,)
          ),
        ],
      ),
      body: HomePageForProvider(),
      drawer: CustomDrawerForServiceProvider(),
    );
    // return Scaffold(
    //   body: Center(
    //     child: Text("This is the Main Page for Service providers"),
    //   ),
    // );
  }
}
