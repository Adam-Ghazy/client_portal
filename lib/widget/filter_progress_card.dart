import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';

class FilterProgressCard extends StatefulWidget {
  final bool selected;
  final String lable;
  final Function(bool) onTap;

  FilterProgressCard(
      {required this.selected, required this.lable, required this.onTap});

  @override
  _FilterProgressCardState createState() => _FilterProgressCardState();
}

class _FilterProgressCardState extends State<FilterProgressCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(true);
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        decoration: widget.selected
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              )
            : BoxDecoration(
                color: Color(0xFF0368FB),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
        child: Text(
          widget.lable,
          style: primaryTextStyle.copyWith(
            color: widget.selected ? primaryColor : Colors.white,
            fontSize: 16,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
