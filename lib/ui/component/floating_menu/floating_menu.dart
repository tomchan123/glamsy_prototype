import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FloatingMenu extends StatelessWidget {
const FloatingMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
    return Container(
      height: 35,
      width: 90,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200.withOpacity(1),
          width: 1.5
        ),
        color: Colors.white10.withOpacity(0.6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _menuButton(Icons.more_horiz),
          VerticalDivider(
            width: 4,
          ),
          _menuButton(Icons.gps_fixed),
        ],
      ),
    );
  }

  Widget _menuButton(
    IconData icon,
  ) {
    return InkWell(
      onTap: () {},
      child: Icon(
        icon,
      ),
    );
  }
}