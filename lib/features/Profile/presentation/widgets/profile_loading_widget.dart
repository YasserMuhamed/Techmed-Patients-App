import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/features/Profile/presentation/widgets/user_info.dart';
import 'package:techmed/features/auth/data/models/user_model/user_data.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      effect: ShimmerEffect(baseColor: AppColors.darkColor, highlightColor: AppColors.cardBackground),
      child: UserInfo(user: UserData(id: 12, name: 'Loading...', email: 'Loading...', phoneNumber: "Loading...", nationalId: "Loading...")),
    );
  }
}
