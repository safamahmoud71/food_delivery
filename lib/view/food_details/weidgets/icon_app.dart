import 'package:flutter/material.dart';
class IconApp extends StatelessWidget {
  const IconApp(
      {super.key,
        this.size=40,
        required this.icon,
        this.iconSize =20,
        this.backgroundColor = const Color(0xfffcf4e4),
        this.iconColor =const Color(0xff756d54) });
  final double size;
  final double iconSize;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size/2),

      ),
      child: Icon(icon, size: iconSize, color: iconColor,),
    );
  }
}