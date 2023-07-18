import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/hidden_drawer.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'screens/login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electrical Store',
      theme: ThemeData(
        textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        
      ),
        
      
      home: Builder(
        builder: (BuildContext context) {
          FirebaseAuth.instance
              .authStateChanges()
              .listen((User? user) {
            if (user == null) {
              print('User is currently signed out!');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  login()),
              );

            } else {
              print('User is signed in!');
              String myemail = FirebaseAuth.instance.currentUser!.email.toString();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HiddenDrawer()),
              );
            }
          });

          // return your app's home widget here
          return HiddenDrawer();
        },
      ),
      

    );
  }
}
class hidden_drawer extends StatefulWidget {

  @override
  State<hidden_drawer> createState() => _hidden_drawerState();
}

class _hidden_drawerState extends State<hidden_drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: loginscreen(),
    );
    
  }
}

class loginscreen extends StatefulWidget {

  @override
  State<loginscreen> createState() => _loginpageState();
}

class _loginpageState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "hello again", 
        style: TextStyle(
          color:Colors.black,
          fontSize: 28.0, 
          fontWeight: FontWeight.bold,
          ),
        ),
      Text(
          "login to app",
          style: TextStyle(),)

      ],
    ),

    );
    
  }
}