import 'package:arecanut_app/repository/auth_repository.dart';
import 'package:arecanut_app/screens/auth/sign_in.dart';
import 'package:arecanut_app/screens/main_page.dart';
import 'package:arecanut_app/screens/main_page_for_provider.dart';
import 'package:arecanut_app/theme/model_theme.dart';
import 'package:arecanut_app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final role = getUserRole();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(
            builder: (context, ModelTheme themeNotifier, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Arecanut App',
                routes: {
                  "/main": (context) => const MainPage(),
                  "/mainForUser": (context) => const MainPage(),
                  "/mainForProvider": (context) => const MainPageForProvider(),
                },
                // theme: ThemeData(
                //   primarySwatch: white,
                // ),
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeNotifier.isDark ? ThemeMode.light : ThemeMode.dark,
                home: role == "user" ? const MainPage() : const MainPageForProvider()
              );
            })
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Arecanut App',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   // home: const SignInScreen(),
    //   home: const MyHomePage(),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInScreen()),
                    (route) => false,);
            }, child: Text("Go to login page")),
            ElevatedButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()),
                    (route) => false,);
            }, child: Text("Go to home page"))
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}