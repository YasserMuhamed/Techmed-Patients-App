import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.dividerColor = const Color(0xFFFFFFFF)});

  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  dividerColor.withOpacity(0),
                  dividerColor.withOpacity(0.2),
                  dividerColor,
                ],
                begin:
                    Intl.getCurrentLocale() == 'ar'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                end:
                    Intl.getCurrentLocale() == 'ar'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.circular(1.r),
            ),
          ),
        ),
      ],
    );
  }
}
