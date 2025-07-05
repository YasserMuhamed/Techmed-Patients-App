import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techmed/configs/theme/app_colors.dart';

class SvgICContainer extends StatelessWidget {
  const SvgICContainer({super.key, required this.svgPath});
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.dividerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SvgPicture.asset(svgPath),
    );
  }
}
