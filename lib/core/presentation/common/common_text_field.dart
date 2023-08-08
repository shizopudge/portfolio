import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/theme.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double fontSize;
  final BoxConstraints constraints;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.width,
    required this.fontSize,
    required this.constraints,
    this.maxLines = 1,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withOpacity(.55),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppTheme.purple,
              height: 1,
              fontSize: fontSize,
            ),
        maxLines: maxLines,
        cursorColor: AppTheme.purple,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          constraints: constraints,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppTheme.purple.withOpacity(.55),
                height: 1,
                fontSize: fontSize,
              ),
          filled: true,
          fillColor: AppTheme.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21),
            borderSide: const BorderSide(
              color: AppTheme.purple,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21),
            borderSide: const BorderSide(
              color: AppTheme.purple,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
