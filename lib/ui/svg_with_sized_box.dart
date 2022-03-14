import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


//? bunu böyle kullanmak mantıklı mı ?  araya consumer koyma şansımı kaybediyorum
class SvgWithSizedBox extends StatelessWidget {
  const SvgWithSizedBox({ 
    Key? key,
    required this.height,
    required this.width,
    required this.svgAssets,
  }) : super(key: key);

  final double height;
  final double width;
  final String svgAssets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(svgAssets,fit: BoxFit.cover),
    );
  }
}