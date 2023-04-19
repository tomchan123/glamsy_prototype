import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prototype/ui/component/bottom_navbar/bottom_navbar.dart';
import 'package:prototype/ui/component/custom_icon_button/custom_icon_button.dart';
import 'package:prototype/ui/component/floating_menu/floating_menu.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "記錄",
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          _headerActionArea(context, theme),
          Expanded(child: _historyTabArea(context, theme)),
        ],
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 2),
      floatingActionButton: const FloatingMenu(),
    );
  }

  Widget _headerActionArea(
    BuildContext context,
    ThemeData theme,
  ) {
    return Container(
      color: theme.colorScheme.background,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            name: "美容商城", 
            icon: FontAwesomeIcons.store,
          ),
          CustomIconButton(
            name: "會員中心", 
            icon: FontAwesomeIcons.crown,
          ),
          CustomIconButton(
            name: "簽到抽獎", 
            icon: FontAwesomeIcons.calendarDays
          ),
          CustomIconButton(
            name: "積分商城", 
            icon: FontAwesomeIcons.spa,
          ),
        ],
      ),
    );
  }

  Widget _historyTabArea(
    BuildContext context,
    ThemeData theme,
  ) {
    return DefaultTabController(
      length: 3, 
      child: Column(
        children: [
          Container(
            color: theme.colorScheme.background,
            child: TabBar(
              labelStyle: theme.textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              unselectedLabelStyle: theme.textTheme.titleMedium!.copyWith(
                color: Color(0xff949494),
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: theme.colorScheme.primary,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.symmetric(
                horizontal: 38
              ),
              tabs: const [
                Tab(text: "待付款"),
                Tab(text: "待體驗",),
                Tab(text: "已體驗",)
              ]
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _unpaidList(context, theme),
                _paidList(context, theme),
                _historicalList(context, theme),
              ]
            ),
          )
        ],
      )
    );
  }

  Widget _unpaidList (
    BuildContext context,
    ThemeData theme,
  ) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.bottomEnd
            - AlignmentDirectional(0.15, 0.25),
          child: GestureDetector(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    theme.colorScheme.primary, 
                    theme.colorScheme.secondary,
                  ],
                  stops: const [0.4, 1],
                  center: Alignment.center,
                  radius: 0.8,
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.fromDirection(90 * pi/180, 8),
                    color: theme.colorScheme.shadow,
                    blurRadius: 8
                  ),
                ]
              ),
              child: Center(
                child: Text(
                  "預約",
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox.expand(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 100,),
              SizedBox(
                width: 300,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    theme.hintColor, BlendMode.srcATop
                  ),
                  child: Image.asset(
                    "assets/images/misc/shopping.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Text(
                "還沒有訂單哦~請先去預約吧",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.hintColor,
                ),
              )
            ],
          ),
        ),
      ]
    );
  }

  Widget _paidList(
    BuildContext context,
    ThemeData theme,
  ) {
    return Container();
  }

  Widget _historicalList(
    BuildContext context,
    ThemeData theme,
  ) {
    return Container();
  }

}