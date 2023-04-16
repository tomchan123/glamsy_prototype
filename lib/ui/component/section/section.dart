import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Section extends StatelessWidget {
  Widget child;
  Widget? headerSide;
  String title;

  Section({ 
    Key? key,
    required this.title,
    this.headerSide,
    required this.child 
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.background,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _headerTitle(theme, title),
              Container(child: headerSide),
            ],
          ),
          SizedBox(height: 16,),
          child,
        ],
      ),
    );
  }

  Widget _headerTitle(
    ThemeData theme,
    String title,
  ) {
    return Row(
      children: [
        SizedBox(
          height: 16,
          width: 6,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary
            ),
          ),
        ),
        SizedBox(width: 6,),
        Text(
          title,
          style: theme.textTheme.titleMedium,
        )
      ],
    );
  }
}