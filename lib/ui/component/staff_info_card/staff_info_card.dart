import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prototype/core/model/staff.dart';

class StaffInfoCard extends StatefulWidget {
  final Staff staff;

  const StaffInfoCard({ 
    Key? key,
    required this.staff,
  }) : super(key: key);

  @override
  _StaffInfoCardState createState() => _StaffInfoCardState();
}

class _StaffInfoCardState extends State<StaffInfoCard> {
  bool isExpanded = false;

  String _getTimeAfterMins(int mins) {
    var timeFromMins = DateTime.now().add(Duration(
      minutes: mins
    ));
    return "${timeFromMins.hour}:${timeFromMins.minute}";
  }

  void _expandBiography() {

  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16
      ),
      height: 148,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xfffefefe),
      ),
      child: Row(
        children: [
          _staffPhoto(context, theme),
          SizedBox(width: 16,),
          Expanded(child: _staffInfo(context, theme)),
        ],
      ),
    );
  }

  Widget _staffPhoto(
    BuildContext context,
    ThemeData theme,
  ) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(52.5),
        border: Border.all(
          color: Colors.white,
          width: 3,
          strokeAlign: BorderSide.strokeAlignOutside
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(60 * pi/180, 3),
            color: theme.colorScheme.shadow,
            blurRadius: 4
          ),
          BoxShadow(
            offset: Offset.fromDirection(120 * pi/180, 3),
            color: theme.colorScheme.shadow,
            blurRadius: 4
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          widget.staff.imageDir,
          fit: BoxFit.cover,
        ),
      )
    );
  }

  Widget _staffInfo(
    BuildContext context,
    ThemeData theme,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _staffName(context, theme),
            _staffAvailability(context, theme),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _staffTitle(context, theme),
            _staffWorkedHours(context, theme),
          ],
        ),
        SizedBox(height: 8,),
        _staffRating(context, theme),
        // SizedBox(height: 8,),
        _staffBiography(context, theme),
      ],
    );
  }

  Widget _staffName(
    BuildContext context,
    ThemeData theme,
  ) {
    return Text(
      widget.staff.name,
      style: theme.textTheme.titleMedium!.copyWith(
        fontSize: 17,
      ),
    );
  }

  Widget _staffAvailability(
    BuildContext context,
    ThemeData theme,
  ) {
    var isAvailable = widget.staff.waitTime == 0;

    var mainColor = isAvailable
      ? Color(0xff9bcab0)
      : Color(0xffe58a93);

    var text = isAvailable
      ? "空閒"
      : "等待${widget.staff.waitTime}分鐘"
        "(預計${_getTimeAfterMins(widget.staff.waitTime)})結束";

    return Container(
      constraints: BoxConstraints(
        minWidth: 60
      ),
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8
      ),
      decoration: BoxDecoration(
         color: mainColor.withOpacity(0.1),
         borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.labelSmall!.copyWith(
            color: mainColor,
            letterSpacing: -1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _staffTitle(
    BuildContext context,
    ThemeData theme,
  ) {
    var isSenior = widget.staff.staffType == StaffType.senior;

    var mainColor = isSenior
      ? Color(0xfff39410)
      : Color(0xffef6904);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 6
      ),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          widget.staff.positionTitle,
          style: theme.textTheme.labelSmall!.copyWith(
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }

  Widget _staffWorkedHours(
    BuildContext context,
    ThemeData theme,
  ) {
    return Text(
      "已服務${widget.staff.hoursWorked}個小時",
      style: theme.textTheme.labelSmall!.copyWith(
        color: theme.hintColor,
        letterSpacing: 0,
      ),
    );
  }

  Widget _staffRating(
    BuildContext context,
    ThemeData theme,
  ) {
    var isSenior = widget.staff.staffType == StaffType.senior;

    var ratingIcon = isSenior
      ? FaIcon(
        FontAwesomeIcons.solidStar,
        size: 13,
        color: Color(0xfff39410),
      )
      : FaIcon(
        FontAwesomeIcons.solidGem,
        size: 15,
        color: Color(0xffd09a66)
      );
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List<Widget>.generate(widget.staff.rating, 
        (index) => Padding(
          padding: EdgeInsets.all(1),
          child: ratingIcon,
        )
      ),
    );
  }

  Widget _staffBiography(
    BuildContext context,
    ThemeData theme,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.staff.biography,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.hintColor,
            ),
            overflow: TextOverflow.ellipsis,
          )
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(4),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () => _expandBiography(), 
          child: Text(
            "查看詳情",
            style: theme.textTheme.bodySmall!.copyWith(
              color: Color(0xfff6d1b0),
            ),
          ),
        )
      ],
    );
  }
}