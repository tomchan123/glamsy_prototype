import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/ui/component/section/section.dart';

import '../../component/bottom_navbar/bottom_navbar.dart';
import '../../component/floating_menu/floating_menu.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({ 
    Key? key ,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  var _selectedStore = null;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "主頁",
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 1),
      floatingActionButton: const FloatingMenu(),
    );
  }

  _selecteStoreSection(
    ThemeData theme,
  ) {
    return Section(
      headerSide: Row(
        children: [
          Text(
            "香港",
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.hintColor,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: theme.hintColor,
            size: 16,
          ),
        ]
      ),
      title: "選擇門店", 
      child: Column(
        children: [
          _storeList(theme),
          _storeInfo(theme),
        ],
      )
    );
  }

  Widget _storeList(
    ThemeData theme
  ) {
    return ListView(

    );
  }

  Widget _storeInfo(
    ThemeData theme,
  ) {
    return Row(
      children: [

      ],
    );
  }
}