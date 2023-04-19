import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconButton extends StatelessWidget {
  String name;
  IconData icon;
  double gap;
  double iconSize;
  Color? textColor;

  CustomIconButton({ 
    Key? key,
    this.gap = 8,
    this.iconSize = 30,
    this.textColor,
    required this.name,
    required this.icon, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);

    textColor = textColor ?? theme.hintColor;

    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
              LinearGradient(
                colors: [
                  theme.colorScheme.primary, 
                  theme.colorScheme.secondary
                ],
                stops: [0.2, 0.6],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ).createShader(bounds),
            blendMode: BlendMode.srcIn,
            child: FaIcon(
              icon,
              size: iconSize,
            ),
          ),
          SizedBox(height: gap,),
          Text(
            name,
            style: theme.textTheme.labelLarge!.copyWith(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}