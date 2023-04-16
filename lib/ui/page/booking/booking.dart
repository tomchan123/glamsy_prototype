import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/core/model/store.dart';
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
  Store? _selectedStore;
  List<Store> _stores = Store.getAllStores();

  bool _isSelectedStore(Store store) =>
    _selectedStore?.equal(store) ?? false;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "預約",
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _selectStoreSection(theme),
            SizedBox(height: 16,),
            _storeMapSection(theme),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 1),
      floatingActionButton: const FloatingMenu(),
    );
  }

  Widget _storeMapSection(
    ThemeData theme,
  ) {
    return Section(
      title: "門店地圖", 
      child: Padding(
        padding: EdgeInsets.all(24),
      )
    );
  }

  Widget _selectStoreSection(
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _storeList(theme),
          _storeInfo(theme),
        ],
      )
    );
  }

  Widget _storeList(
    ThemeData theme,
  ) {
    return SizedBox(
      height: 78,
      child: ListView(
        padding: EdgeInsets.only(bottom: 8),
        scrollDirection: Axis.horizontal,
        children: _stores.map<Widget>((store) {
          var nameTextStyle = _isSelectedStore(store)
            ? theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onPrimary,
            )
            : theme.textTheme.titleMedium;
          var distTextStyle = _isSelectedStore(store)
            ? theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.onPrimary,
            )
            : theme.textTheme.labelMedium!.copyWith(
              color: Colors.grey.shade400,
            );
          var containerColor = _isSelectedStore(store)
            ? theme.colorScheme.primary
            : theme.colorScheme.background;
    
          return GestureDetector(
            onTap: () => setState(() {
              _selectedStore = store;
            }),
            child: Container(
              width: _isSelectedStore(store) ? null : 120,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: theme.colorScheme.primary,
                ),
              ), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    store.name,
                    style: nameTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "距離${store.distance}m",
                    style: distTextStyle
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _storeInfo(
    ThemeData theme,
  ) {
    if (_selectedStore == null) {
      return Container();
    }

    return SizedBox(
      height: 105,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16
        ),
        child: Row(
          children: [
            SizedBox(
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedStore!.name,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 6,),
                  Text(
                    _selectedStore!.address,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.hintColor,
                    ),
                  )
                ],
              ),
            ),
            VerticalDivider(
              width: 50,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    color: theme.colorScheme.primary, 
                    iconSize: 26,
                    icon: Icon(
                      CupertinoIcons.location_fill,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: theme.colorScheme.primary,
                    iconSize: 26,  
                    icon: Icon(
                      CupertinoIcons.phone_fill,
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}