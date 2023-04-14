import "dart:math";

import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:prototype/ui/component/bottom_navbar/bottom_navbar.dart";
import "package:prototype/ui/component/custom_card/custom_card.dart";

import "../../component/floating_menu/floating_menu.dart";

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "主頁",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _landingArea(theme),
                Placeholder(),
                Placeholder(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight + Alignment(-0.1, -0.05),
            child: FloatingMenu(),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }

  Widget _landingArea(
    ThemeData theme,
  ) {
    var images = [
      "assets/images/adverts/advert1.jpg",
      "assets/images/adverts/advert2.jpg",
      "assets/images/adverts/advert3.jpg",
      "assets/images/adverts/advert4.jpg",
      "assets/images/adverts/advert5.jpg",
    ];

    return Container(
      color: theme.colorScheme.background,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(
                      Icons.location_pin,
                    ),
                    label: Text(
                      "香港",
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Text(
                      "香港中環分店",
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(
                      CupertinoIcons.location_fill,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(
                      CupertinoIcons.phone_fill,
                      color: theme.colorScheme.primary,
                    )
                  )
                ],
              ),
            ),
          ),
          CarouselSlider(
            items: images.map<Widget>((img) {
                return CustomCard(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                  )
                );
            }).toList(), 
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enlargeFactor: 0.3,
              enlargeCenterPage: true,
            )
          )
        ],
      ),
    );
  }
}
