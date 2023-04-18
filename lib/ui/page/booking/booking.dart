import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:prototype/core/model/store.dart';
import 'package:prototype/ui/component/custom_card/custom_card.dart';
import 'package:prototype/ui/component/section/section.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../component/bottom_navbar/bottom_navbar.dart';
import '../../component/floating_menu/floating_menu.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({ 
    Key? key ,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
  with SingleTickerProviderStateMixin {
  Store? _selectedStore;
  final List<Store> _stores = Store.getAllStores();

  final MapController _mapController = MapController();

  final List<String> _imageDirs = [
    "assets/images/adverts/advert2.jpg",
    "assets/images/adverts/advert4.jpg",
    "assets/images/adverts/advert5.jpg",
  ];

  PersistentBottomSheetController? _bottomSheetController;

  bool _isSelectedStore(Store store) =>
    _selectedStore?.equal(store) ?? false;

  void _onStoreTap(
    Store store,
    BuildContext context,
  ) {
    setState(() {
      _selectedStore = store;
    });
    _mapController.move(store.latlng, 16);

    var theme = Theme.of(context);

    _bottomSheetController?.close();
    _bottomSheetController = Scaffold.of(context).showBottomSheet(
      (context) => _bookStaffBottomSheet(theme, store),
      elevation: 16,
      enableDrag: true,
      backgroundColor: theme.colorScheme.background,
    );
  }

  void _navigateToBookStaff(
    BuildContext context,
    Store store,
  ) {
    Navigator.of(context).pushNamed(
      "/book-staff",
      arguments: store,
    );
  }

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
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _selectStoreSection(theme, context),
                SizedBox(height: 16,),
                _storeMapSection(theme),
                SizedBox(height: 16,),
                _storePhotoSection(theme),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: BottomNavbar(selectedIndex: 1),
      floatingActionButton: const FloatingMenu(),
    );
  }

  Widget _bookStaffBottomSheet(
    ThemeData theme,
    Store store,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 100,
      child: SizedBox.expand(
        child: FilledButton(
          onPressed: () => _navigateToBookStaff(context, store),
          style: FilledButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: theme.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "立即預約美容師",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 4,
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "(${store.name})",
                style: theme.textTheme.labelSmall!.copyWith(
                  color: theme.colorScheme.onPrimary.withOpacity(0.8),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget _storePhotoSection(
    ThemeData theme,
  ) {
    return Section(
      title: "門店照片", 
      headerSide: Text(
        "營業時間: 10:00 - 22:00",
        style: theme.textTheme.titleSmall!.copyWith(
          color: theme.hintColor,
        ),
      ),
      child: _storePhotoList(theme, _imageDirs),
    );
  }

  Widget _storePhotoList(
    ThemeData theme,
    List<String> imageDirs,
  ) {
    return SizedBox(
      height: 190,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(bottom: 16,),
        children: imageDirs.map<Widget>(
          (imageDir) => _storePhotoTile(theme, imageDir)
        ).toList(),
      ),
    );
  }

  Widget _storePhotoTile(
    ThemeData theme,
    String imageDir
  ) {    
    return Container(
      width: 180,
      height: 100,
      margin: EdgeInsets.only(left: 16),
      child: Image.asset(
        imageDir,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _storeMapSection(
    ThemeData theme,
  ) {
    return Section(
      title: "門店地圖", 
      child: Container(
        height: 300,
        padding: EdgeInsets.all(16)
          - EdgeInsets.only(top: 16),
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: LatLng(22.303228118988343, 114.17179425668809),
            zoom: 12.3
          ),
          nonRotatedChildren: [
            AttributionWidget(
              attributionBuilder: (context) =>
                Container(
                  color: Colors.white.withOpacity(0.8),
                  padding: EdgeInsets.all(4),
                  child: const Text(
                    "© MapBox",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0078a8),
                    ),
                  ),
                ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight
                    + Alignment(-0.05, -0.3),
                  child: CustomCard(
                    width: 34,
                    backgroundColor: Colors.white,
                    radius: CustomCardRadius.small,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () => _mapController.move(
                            _mapController.center,
                            _mapController.zoom + 2.0
                          ), 
                          child: Text(
                            "+",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ),
                        Divider(
                          height: 2,
                          indent: 6,
                          endIndent: 6,
                        ),
                        TextButton(
                          onPressed: () => _mapController.move(
                            _mapController.center,
                            _mapController.zoom - 2.0
                          ), 
                          child: Text(
                            "-",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
          children: [
            TileLayer(
              urlTemplate: "https://api.mapbox.com/styles/v1/wdcgpapi/clgjkfnk5000401p7e17af6z7/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoid2RjZ3BhcGkiLCJhIjoiY2xnamtic3RkMTYxcTNsbW9lZXdmNDBhdCJ9.k1RNb__wbw50ElHVnTMNFQ",
              userAgentPackageName: "com.queenyapp.glamsy",
            ),
            MarkerLayer(
              markers: _stores.map<Marker>((store) {
                return Marker(
                  point: store.latlng,
                  width: 36,
                  height: 48, 
                  anchorPos: AnchorPos.align(AnchorAlign.top),
                  builder: (context) {
                    return Icon(
                      Icons.location_on_rounded,
                      size: 36,
                      color: theme.colorScheme.primary,
                    );
                  }
                );
              }).toList(),
            )
          ],
        ),
        
      )
    );
  }

  Widget _selectStoreSection(
    ThemeData theme,
    BuildContext context,
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
          _storeList(theme, context),
          _storeInfo(theme),
        ],
      )
    );
  }

  Widget _storeList(
    ThemeData theme,
    BuildContext context,
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
            onTap: () => _onStoreTap(store, context),
            child: Container(
              width: _isSelectedStore(store) ? null : 120,
              margin: EdgeInsets.only(left: 16),
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