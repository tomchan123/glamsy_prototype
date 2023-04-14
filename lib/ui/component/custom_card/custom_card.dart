import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum CustomCardRadius {
  small(8.0),
  medium(16.0),
  large(32.0);

  const CustomCardRadius(this.value);
  final double value;
}

class CustomCard extends StatelessWidget {
  Widget child;
  CustomCardRadius radius;
  EdgeInsets? margin;
  double? width;
  double? height;
  bool enableShadow;

  CustomCard({ 
    Key? key,
    this.margin,
    this.width,
    this.height,
    this.enableShadow = true,
    this.radius = CustomCardRadius.medium,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);

    return Container(
      width: 600,
      height: 400,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: !enableShadow
          ? null
          :[
            BoxShadow(
              offset: Offset.fromDirection(60 * pi/180, 5),
              color: theme.colorScheme.shadow,
              blurRadius: 8
            ),
            BoxShadow(
              offset: Offset.fromDirection(120 * pi/180, 5),
              color: theme.colorScheme.shadow,
              blurRadius: 8
            ),
          ]
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}