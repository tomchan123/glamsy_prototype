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
  BoxConstraints? constraints;
  BlendMode? backgroundBlendMode;

  CustomCard({ 
    Key? key,
    this.margin,
    this.constraints,
    this.backgroundBlendMode,
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
      constraints: constraints,
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        backgroundBlendMode: backgroundBlendMode,
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