import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/product.dart';
import'../../screens/details_screen.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
     key,
     required this.itemIndex,
     required this.product,

  }) : super(key: key);

  final int itemIndex;
  final Product product;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultpadding,
        vertical: kDefaultpadding / 2,
      ),
      height: 190.0,
      child: InkWell(
        
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GestureDetector(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsScreen(
                      product: product
                    )),
                  );
            },
            child:  Container(
              height: 166.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ],
              ),
            ),
            ),
           
            Positioned(
              top: 0.0,
              left: 0.0,
              child: GestureDetector(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsScreen(
                      product: product,
                    )),
                  );
            },
            child:Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultpadding),
                height: 160.0,
                width: 200.0,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: SizedBox(
                height: 136.0,
                // Because oure image is 200 width, then: width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultpadding),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultpadding),
                      child: Text(
                        product.subTitle,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultpadding),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultpadding * 1.5, // 30 px padding
                          vertical: kDefaultpadding / 5, // 5 px padding
                        ),
                        decoration: BoxDecoration(
                          color: ksecondaryColor,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text('السعر: \$${product.price}'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}