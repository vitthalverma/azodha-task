import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.name,
    required this.onTap,
    required this.nameColor,
    required this.borderColor,
  });
  final double height;
  final double width;
  final Color buttonColor;
  final String name;
  final Color nameColor;
  final VoidCallback onTap;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(3.w),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 14.5.sp,
              color: nameColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
