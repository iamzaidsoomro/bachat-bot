import 'package:bachat_bot/utils/color_swatch.dart';
import './components/bachat_card.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:google_fonts/google_fonts.dart';

import 'components/bachat_section.dart';

class BachatSaleView extends GetWidget {
  const BachatSaleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const BachatSection(
                  title: "Clothing",
                  buttonText: "See All",
                  children: [
                    BachatCard(
                      imageName:
                          'https://cdn.shopify.com/s/files/1/2290/7887/products/F0060209626_lowers_3.jpg?v=1661841392',
                      link: "https://www.google.com",
                      categories: "Baggy Blue Denim Jeans blah blah blah",
                      sale: "50% off",
                      rating: 4,
                    ),
                    BachatCard(
                      imageName:
                          'https://static05.jockey.in/uploads/dealimages/6502/zoomimages/black-sport-t-shirt-2714-16.jpg',
                      link: "https://www.google.com",
                      categories: "Black T-Shirt Cotton",
                      sale: "50% off",
                      rating: 5,
                    ),
                    BachatCard(
                      imageName:
                          'https://static.zara.net/photos///2022/I/0/2/p/6861/433/710/2/w/438/6861433710_2_1_1.jpg?ts=1658146998745',
                      link: "https://www.google.com",
                      categories: "Creme Chinos",
                      sale: "50% off",
                      rating: 3,
                    ),
                    BachatCard(
                      imageName:
                          'https://www.stylesnic.com/wp-content/uploads/2020/08/Light-cream-dress-with-open-front-shirt.jpg',
                      link: "https://www.google.com",
                      categories: "Pink Open Shirt",
                      sale: "50% off",
                      rating: 4,
                    )
                  ],
                ),
                const BachatSection(
                  title: "Tech-Accessories",
                  buttonText: "See All",
                  children: [
                    BachatCard(
                      imageName:
                          'https://cdn.shopify.com/s/files/1/0077/6699/9158/products/sticky-bunny-shop-ps4-controller-vaporwave-retro-80s-ps4-controller-skin-11938429370486_2000x.jpg?v=1562220490',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 5,
                    ),
                    BachatCard(
                      imageName:
                          'https://globalcomputers.pk/wp-content/uploads/2021/06/EFebwCEXoAEWHV-.jpg',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 4,
                    ),
                    BachatCard(
                      imageName:
                          'https://vmart.pk/wp-content/uploads/2022/09/Bloody-A70-Light-Strike-Gaming-Mouse.jpg',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 4,
                    ),
                    BachatCard(
                      imageName:
                          'https://myshop.pk/pub/media/catalog/product/cache/26f8091d81cea4b38d820a1d1a4f62be/r/e/redragon_themis_2_h220n_-_wired_gaming_headset_myshop-pk-002.jpg',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 3,
                    )
                  ],
                ),
                const BachatSection(
                  title: "Cosmetics",
                  buttonText: "See All",
                  children: [
                    BachatCard(
                      imageName:
                          'https://images-na.ssl-images-amazon.com/images/I/61X7wEZVPRL._SL1430_.jpg',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 4,
                    ),
                    BachatCard(
                      imageName:
                          'https://www.vegas.pk/beta-admin/public/storage/images/product/variants/loreal-paris-true-match-blush-120-rose-santal-pink.jpg',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 4,
                    ),
                    BachatCard(
                      imageName:
                          'https://cdn.shopify.com/s/files/1/0561/4259/4241/products/L_Oreal-Paris-Color-Riche-Matte-Addiction-Lipstick-349-Cherry-Front-Row.jpg?v=1649063419',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 5,
                    ),
                    BachatCard(
                      imageName:
                          'https://cdn.shopify.com/s/files/1/0276/5317/7437/products/Maybelline_Volum_Express_The_Colossal_Waterproof_Mascara_2048x.jpg?v=1570530990',
                      link: "https://www.google.com",
                      categories: "clothing",
                      sale: "50% off",
                      rating: 4,
                    )
                  ],
                )
              ])),
    );
  }
}
