import "dart:math";

import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:prototype/ui/component/bottom_navbar/bottom_navbar.dart";
import "package:prototype/ui/component/custom_card/custom_card.dart";

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
      body: Column(
        children: [
          _landingArea(theme),
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
          CarouselSlider(
            items: images.map<Widget>((img) {
                return CustomCard(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 600,
                  height: 400,
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
