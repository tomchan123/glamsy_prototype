import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prototype/ui/component/bottom_navbar/bottom_navbar.dart';
import 'package:prototype/ui/component/custom_card/custom_card.dart';
import 'package:prototype/ui/component/custom_icon_button/custom_icon_button.dart';
import 'package:prototype/ui/component/floating_menu/floating_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double balance = 0.0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -650,
            child: _background(context, theme)
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _personalInfo(context, theme),
                    _quickActions(context, theme),
                    _healthProfile(context, theme),
                    _shopping(context, theme),
                    _settings(context, theme),
                  ],
                ),
              )
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 3),
      floatingActionButton: const FloatingMenu(),
    );
  }

  Widget _background(
    BuildContext context,
    ThemeData theme,
  ) {
    double diameter = 900;
    var radius = diameter / 2;

    return SizedBox(
      height: diameter,
      width: diameter,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset.fromDirection(90 * pi/180, 8),
              color: theme.colorScheme.shadow,
              blurRadius: 24
            ),
          ],
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary, 
              theme.colorScheme.secondary,
            ],
            stops: [0.3, 0.8],
            begin: Alignment.bottomCenter,
            end: Alignment.bottomCenter
              - Alignment(0, 0.6),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          )
        ),
      ),
    );
  }

  Widget _personalInfo(
    BuildContext context,
    ThemeData theme,
  ) {
    return SizedBox(
      child: Stack(
        children: [
          CustomCard(
            radius: CustomCardRadius.large,
            margin: EdgeInsets.only(top: 72, bottom: 16),
            height: 240,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 58,),
                Text(
                  "香港用戶",
                  style: theme.textTheme.displayMedium,
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "帳戶餘額",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.primary
                      ),
                    ),
                    SizedBox(width: 4,),
                    FaIcon(
                      FontAwesomeIcons.eye,
                      color: theme.colorScheme.primary,
                      size: 18,
                    )
                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.sackDollar,
                      size: 26,
                      color: theme.colorScheme.primary,
                    ),
                    SizedBox(width: 4,),
                    Baseline(
                      baselineType: TextBaseline.alphabetic,
                      baseline: 33,
                      child: Text(
                        balance.toStringAsFixed(2),
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Baseline(
                      baseline: 26,
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        "元",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4,),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.5,
                    ),
                    fixedSize: Size.fromWidth(120)
                  ),
                  onPressed: () => setState(() {
                    balance += 100;
                  }), 
                  child: Text(
                    "充值",
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  )
                )
              ],
            ),
          ),
          Positioned(
            top: 28,
            left: 155,
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(44),
                border: Border.all(
                  color: theme.colorScheme.background,
                  width: 8,
                  strokeAlign: BorderSide.strokeAlignOutside
                ),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.userTie,
                  size: 48,
                  color: Color(0xffc9c9c9),
                )
              ),
            )
          ),
          Positioned(
            top: 94,
            left: 198,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 6
              ),
              decoration: BoxDecoration(
                color: Color(0xfff8f8f8),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.crown,
                    color: theme.hintColor,
                    size: 16,
                  ),
                  SizedBox(width: 4,),
                  Text(
                    "未開通",
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: theme.hintColor,
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget _quickActions(
    BuildContext context,
    ThemeData theme,
  ) {
    return CustomCard(
      radius: CustomCardRadius.medium,
      enableShadow: false,
      margin: EdgeInsets.only(top: 8),
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              name: "會員中心", 
              icon: FontAwesomeIcons.crown,
              gap: 14,
              iconSize: 42,
              textColor: Colors.black,
            ),
            CustomIconButton(
              name: "優惠券", 
              icon: FontAwesomeIcons.ticket,
              gap: 14,
              iconSize: 42,
              textColor: Colors.black,
            ),
            CustomIconButton(
              name: "代金卷", 
              icon: FontAwesomeIcons.moneyBills,
              gap: 14,
              iconSize: 42,
              textColor: Colors.black,
            ),
            CustomIconButton(
              name: "我的積分", 
              icon: FontAwesomeIcons.spa,
              gap: 14,
              iconSize: 42,
              textColor: Colors.black,
            ),
          ],
        ),
      )
    );
  }

  Widget _healthProfile(
    BuildContext context,
    ThemeData theme,
  ) {
    return CustomCard(
      margin: EdgeInsets.only(top: 16),
      radius: CustomCardRadius.medium,
      enableShadow: false,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.envelopeOpenText,
              size: 18,
            ),
            SizedBox(width: 4,),
            Expanded(
              child: Text(
                "加入我的健康檔案，讓我們更了解你~",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: theme.hintColor,
              size: 14,
            )
          ],
        ),
      )
    );
  }

  Widget _shopping(
    BuildContext context,
    ThemeData theme,
  ) {
    return CustomCard(
      radius: CustomCardRadius.medium,
      margin: EdgeInsets.only(top: 16),
      enableShadow: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "團購",
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 16,),
                    _shoppingActions(
                      context, 
                      theme, 
                      icon: FontAwesomeIcons.bagShopping, 
                      text: "卡券中心"
                    ),
                    SizedBox(height: 12,),
                    _shoppingActions(
                      context, 
                      theme, 
                      icon: FontAwesomeIcons.ticket, 
                      text: "我的卡券"
                    )
                  ],
                ),
              )
            ),
            SizedBox(
              height: 118,
              child: VerticalDivider(
                width: 32,
                indent: 32,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "商城",
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 16,),
                    _shoppingActions(
                      context, 
                      theme, 
                      icon: FontAwesomeIcons.clipboardList, 
                      text: "商城訂單"
                    ),
                    SizedBox(height: 12,),
                    _shoppingActions(
                      context, 
                      theme, 
                      icon: FontAwesomeIcons.diagramProject, 
                      text: "推廣記錄"
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      )
    );
  }

  Widget _shoppingActions(
    BuildContext context,
    ThemeData theme, {
    required IconData icon,
    required String text,
  }) {
    double radius = 18;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: radius*2,
          height: radius*2,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: FaIcon(
              icon,
              size: radius + 2,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        SizedBox(width: 8,),
        Text(
          text,
          style: theme.textTheme.labelLarge!.copyWith(
            fontSize: 16
          ),
        )
      ],
    );
  }

  Widget _settings(
    BuildContext context,
    ThemeData theme,
  ) {
    return CustomCard(
      height: 200,
      radius: CustomCardRadius.medium,
      margin: EdgeInsets.only(top: 16),
      enableShadow: false,
      child: Column(
        children: [],
      )
    );
  }
}