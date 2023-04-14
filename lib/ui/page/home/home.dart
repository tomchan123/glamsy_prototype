import "dart:math";

import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:prototype/ui/component/bottom_navbar/bottom_navbar.dart";
import "package:prototype/ui/component/bouncing/bouncing.dart";
import "package:prototype/ui/component/circular_action_button/circular_action_button.dart";
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _landingArea(theme),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
      floatingActionButton: const FloatingMenu(),
    );
  }

  Widget _landingArea(
    ThemeData theme,
  ) {
    return Container(
      color: theme.colorScheme.background,
      child: Column(
        children: [
          _locationHeader(theme),
          _imageSlider(theme),
          _actionTileArea(theme),
          _portalButtonArea(theme),
        ]
      ),
    );
  }

  Widget _locationHeader(
    ThemeData theme,
  ) {
    return Padding(
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
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Text(
              "香港中環分店",
              style: theme.textTheme.bodyMedium,
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
    );
  }

  Widget _imageSlider(
    ThemeData theme,
  ) {
    var advertImages = [
      "assets/images/adverts/advert1.jpg",
      "assets/images/adverts/advert2.jpg",
      "assets/images/adverts/advert3.jpg",
      "assets/images/adverts/advert4.jpg",
      "assets/images/adverts/advert5.jpg",
    ];

    return CarouselSlider(
      items: advertImages.map<Widget>((img) {
          return CustomCard(
            width: 600,
            height: 400,
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: Image.asset(
              img,
              fit: BoxFit.fill,
            )
          );
      }).toList(), 
      options: CarouselOptions(
        viewportFraction: 0.85,
        aspectRatio: 16 / 8.6,
        enlargeFactor: 0.3,
        enlargeCenterPage: true,
      )
    );
  }

  Widget _actionTileArea(
    ThemeData theme,
  ) {
    return Container(
      height: 180,
      padding: EdgeInsets.symmetric(
        horizontal: 24, 
        vertical: 4
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _largeActionTile(theme)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _mediumActionTile(theme)),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: 
                        _smallActionTile(
                          theme, 
                          Icons.checklist_rtl_rounded, 
                          "簽到抽獎"
                        )
                      ),
                      Expanded(child: 
                        _smallActionTile(
                          theme, 
                          Icons.question_answer_outlined, 
                          "客戶服務"
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _portalButtonArea(
    ThemeData theme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularActionButton(
            icon: FontAwesomeIcons.crown,
            label: "會員中心"
          ),
          CircularActionButton(
            icon: FontAwesomeIcons.ticket,
            label: "優惠券"
          ),
          CircularActionButton(
            icon: FontAwesomeIcons.brush,
            label: "量身訂做"
          ),
          CircularActionButton(
            icon: FontAwesomeIcons.store,
            label: "積分商店"
          ),
          CircularActionButton(
            icon: FontAwesomeIcons.gift,
            label: "邀請有女"
          ),
        ],
      ),
    );
  }



  Widget _largeActionTile(
    ThemeData theme,
  ) {
    return Bouncing(
      child: CustomCard(
        margin: EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "立即預約",
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                "頂級美容服務",
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Icon(
                Icons.calendar_month_outlined,
                color: theme.colorScheme.primary,
                size: 56,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mediumActionTile(
    ThemeData theme,
  ) {
    return Bouncing(
      child: CustomCard(
        margin: EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "美容產品",
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  Text(
                    "低至七折",
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.shopping_bag_outlined,
                size: 36,
                color: theme.colorScheme.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _smallActionTile(
    ThemeData theme,
    IconData icon,
    String title,
  ) {
    return Bouncing(
      child: CustomCard(
        margin: EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Text(
                title,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
              SizedBox(height: 4,),
              Icon(
                icon,
                size: 36,
                color: theme.colorScheme.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
