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
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200.withOpacity(1),
          width: 1.5
        ),
        color: Colors.white10.withOpacity(0.6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.more_horiz,
                ),
              ),
            ),
          ),
          VerticalDivider(
            width: 2,
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.gps_fixed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}