import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../constants.dart';
import '../../../models/product.dart';

import 'color_dot.dart';
import 'product_image.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the screen
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultpadding),
          decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
          child: Column(
            children: [
              Productimage(
                size: size,
                image: product.image,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultpadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorDot(
                      fillColor: kTextlightColor,
                      isSelected: true,
                    ),
                    ColorDot(
                      fillColor: Colors.blue,
                      isSelected: false,
                    ),
                    ColorDot(
                      fillColor: Colors.red,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultpadding / 2),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                "price\$${product.price}",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color:kTextlightColor,
                ),
              ),
              SizedBox(height: kDefaultpadding),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical:kDefaultpadding / 2),
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultpadding * 1.5,
            vertical: kDefaultpadding / 2,
          ),
          
          decoration: BoxDecoration(
            color: Color(0xFFFCBF1E),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: kDefaultpadding / 2,
              ),
              Text(
                "Get it",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              ElevatedButton.icon(
  onPressed: () async {
    await launch('https://wa.link/zcxvcb');
  },
  icon: Icon(Icons.shop),
  label: Text("Buy now"),
),

            ],
          ),
        ),
      ],
    );
  }
}