import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import 'screens/login.dart';
import 'books_page.dart';
import 'constants.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  // ignore: prefer_const_constructors
  final myTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Shoes Shope",

          //frederickaTheGreat
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.white,
        ),
        HomeScreen(2),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Bags Shope",

          //frederickaTheGreat
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.white,
        ),
        HomeScreen(0),
      ),
       
      
      ScreenHiddenDrawer(
        
        ItemHiddenMenu(
          onTap: () async{
             try {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  login()),
                );
              } on FirebaseAuthException catch (e) {

              }
          },
          name: "Sign out",
          //frederickaTheGreat
          baseStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          selectedStyle: myTextStyle,
          colorLineSelected: Colors.white,
        ),
        BooksPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: kPrimaryColor,
      backgroundColorAppBar: kPrimaryColor,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 40,
      contentCornerRadius: 100,
    );
  }
}