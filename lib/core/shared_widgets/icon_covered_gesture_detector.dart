import 'package:flutter/material.dart';

class IconCoveredGestureDetector extends StatelessWidget {
  const IconCoveredGestureDetector({
    Key? key,
    this.margin,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  
  final EdgeInsetsGeometry? margin;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: margin ?? EdgeInsets.all(width * 0.04),
      child: GestureDetector(
        onTap: onTap(),
        child: Icon(icon),
      ),
    );
  }
}
