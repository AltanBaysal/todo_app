import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.margin,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  
  final EdgeInsetsGeometry? margin;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: margin ?? EdgeInsets.all(width * 0.04),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon),
      ),
    );
  }
}
