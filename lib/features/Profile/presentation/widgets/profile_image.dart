import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      height: 128,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(330.r),
        child: Image.asset("assets/images/profile.png", fit: BoxFit.cover),
      ),
    );
  }
}
