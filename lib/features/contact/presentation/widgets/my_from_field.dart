import 'package:azodha_task/core/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class MyFromField extends StatelessWidget {
  MyFromField({
    super.key,
    required this.controller,
    required this.lable,
    required this.prefix,
    this.suffix,
    required this.validator,
  });

  final TextEditingController controller;
  final String lable;
  final IconData prefix;
  final IconButton? suffix;
  String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: GoogleFonts.poppins(
        fontSize: 15.sp,
        color: AppColors.grey800,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: const BorderSide(color: AppColors.red700),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: const BorderSide(color: AppColors.red700),
        ),
        focusColor: AppColors.grey800,
        suffixIcon: suffix,
        prefixIcon: Icon(prefix, color: AppColors.grey300),
        floatingLabelStyle: GoogleFonts.poppins(
          fontSize: 15.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        label: Text(
          lable,
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
