import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype/core/model/store.dart';
import 'package:prototype/ui/component/badged_icon_button/badged_icon_button.dart';
import 'package:prototype/ui/component/dropdown_chip/dropdown_chip.dart';
import 'package:prototype/ui/component/floating_menu/floating_menu.dart';

class BookStaffPage extends StatefulWidget {
  final Store store;

  const BookStaffPage(
    this.store,
    { 
      Key? key, 
    }
  ) : super(key: key);

  @override
  State<BookStaffPage> createState() => _BookStaffPageState(store);
}

class _BookStaffPageState extends State<BookStaffPage> {
  Store store;

  _BookStaffPageState(
    this.store,
  );

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);

    void _navigateBack(
      BuildContext context,
    ) {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "預約美容師",
          style: theme.textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => _navigateBack(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _storeInfoHeader(context, theme)
              ],
            ),
          );
        }
      ),
      floatingActionButton: const FloatingMenu(),
    );
  }

  Widget _storeInfoHeader(
    BuildContext context,
    ThemeData theme,
  ) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _storeHeaderSlot(context, theme, 
            title: "服務門店 : ", 
            value: store.name, 
            icon: CupertinoIcons.location_fill, 
            sideDisplay: DropdownChip(
              hintText: "切換門店",
            ),
          ),
          Divider(
            height: 1,
          ),
          _storeHeaderSlot(context, theme, 
            title: "門店電話 : ", 
            value: store.phone, 
            icon: CupertinoIcons.phone_fill, 
            sideDisplay: BadgedIconButton.count(
              icon: Icons.shopping_cart_rounded, 
              count: 2,
            )
          )
        ],
      ),
    );
  }

  Widget _storeHeaderSlot(
    BuildContext context,
    ThemeData theme,
    {
      required String title,
      required String value,
      required IconData icon,
      required Widget sideDisplay
    }
  ) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.hintColor,
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(width: 8,),
              IconButton(
                onPressed: () {}, 
                icon: Icon(
                  icon,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
              )
            ],
          ),
          sideDisplay
        ],
      ),
    );
  }

  Widget _staffList(
    BuildContext context,
    ThemeData theme,
  ) {
    return Container();
  }

  Widget _staffInfoTile(
    BuildContext context,
    ThemeData theme,
  ) {
    return Container();
  }
}