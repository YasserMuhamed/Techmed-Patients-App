import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/core/constants/assets.dart';

class PillContainer extends StatelessWidget {
  const PillContainer({super.key});

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
      child: SvgPicture.asset(Assets.assetsSvgsMedicine),
    );
  }
}
