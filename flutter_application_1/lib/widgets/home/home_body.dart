

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/widgets/home/details/details_body.dart';
import 'package:flutter_application_1/widgets/home/product_cart.dart';

import '../../screens/details_screen.dart';

class HomeBody extends StatelessWidget {
  late int sayac;
  HomeBody(this.sayac);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          SizedBox(height: kDefaultpadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70.0),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                
                (sayac>1) ?  ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: products[index],
                   
                  ),
                ) :  ListView.builder(
                  itemCount: product_bag.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: product_bag[index],
                   
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
