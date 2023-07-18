// ignore_for_file: use_key_in_widget_constructors



import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/home/home_body.dart';

 class HomeScreen extends StatelessWidget {

  late int sayac;
  HomeScreen(this.sayac);
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      
      body: HomeBody(sayac),
    );
  }

 
}