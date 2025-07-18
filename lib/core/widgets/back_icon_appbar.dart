import 'package:flutter/material.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';

class BackIconAppBar extends StatelessWidget {
  const BackIconAppBar({
    super.key,
    required this.title,
    this.icon = Icons.arrow_back_ios_new_outlined,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(icon, color: AppColors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Text(title, style: AppTextStyles.poppins18Medium(context)),
        const SizedBox(width: 48), // Placeholder for alignment
      ],
    );
  }
}
