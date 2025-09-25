import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    double dHeight = MediaQuery.of(context).size.height;
    double dWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? dHeight * 0.05,
        width: width ?? dWidth * 0.888,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? color ?? Colors.orange,
            width: 2,
          ),
          color: color ?? Colors.orange,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
