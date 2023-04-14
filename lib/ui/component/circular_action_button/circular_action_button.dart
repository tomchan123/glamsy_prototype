import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Color(0xffd3a876), Color(0xffc37a65)],
              stops: [0.2, 1],
              center: Alignment.center,
              radius: 0.8,
            ),
          ),
          child: Icon(  
            icon,
            size: 32,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ]
    );
  }
}