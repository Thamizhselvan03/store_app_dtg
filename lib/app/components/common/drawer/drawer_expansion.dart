import 'package:flutter/material.dart';

class TwitterDrawerExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const TwitterDrawerExpansionTile(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        dividerColor: Colors.transparent,
        unselectedWidgetColor: Colors.black,
        // here for close state
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
        ), // he
      ),
      child: ExpansionTile(
        collapsedIconColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        children: children,
      ),
    );
  }
}
