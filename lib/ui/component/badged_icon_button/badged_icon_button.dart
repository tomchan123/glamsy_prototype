import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BadgedIconButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final int count;

  const BadgedIconButton.count({ 
    Key? key ,
    this.onPressed,
    required this.icon,
    required this.count,
  }) : super(key: key);

  @override
  State<BadgedIconButton> createState() => _BadgedIconButtonState();
}

class _BadgedIconButtonState extends State<BadgedIconButton> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Badge.count(
      count: widget.count,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      largeSize: 14,
      textStyle: TextStyle(
        fontSize: 11,
      ),
      alignment: AlignmentDirectional(26, 5),
      child: IconButton(
        onPressed: () {}, 
        icon: Icon(
          widget.icon,
          size: 32,
          color: theme.colorScheme.primary,
        )
      ),
    );
  }
}