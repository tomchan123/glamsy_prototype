import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropdownChip extends StatefulWidget {
  final String hintText;

  const DropdownChip({ 
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  _DropdownChipState createState() => _DropdownChipState();
}

class _DropdownChipState extends State<DropdownChip> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      width: 98,
      height: 28,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.hintText,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.hintColor,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black87,
            size: 22
          ),
        ],
      ),
    );
  }
}