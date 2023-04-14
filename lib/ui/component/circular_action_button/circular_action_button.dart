import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircularActionButton extends StatelessWidget {
  IconData icon;
  String label;

  CircularActionButton({ 
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);

    var radius = 24.0;

    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xffdeab75), Color(0xffde9382)],
                stops: [0.2, 1],
                center: Alignment.center,
                radius: 0.8,
              ),
              borderRadius: BorderRadius.circular(radius)
            ),
            child: Center(
              child: FaIcon(
                icon,
                size: radius*2 * 0.52,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ),
          SizedBox(height: 6,),
          Text(
            label,
            style: theme.textTheme.labelMedium,
          )
        ]
      ),
    );
  }
}