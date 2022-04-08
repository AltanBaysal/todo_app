import 'package:flutter/material.dart';
import 'package:todo_app/screens/helper/build_context_extension.dart';

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
    return Container(
      margin: margin ?? EdgeInsets.all(context.width * 0.04),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon),
      ),
    );
  }
}
