import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/features/main/presentation/widgets/prescriptions_and_vaccinations_section.dart';
import 'package:techmed/features/main/presentation/widgets/todays_medications_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.pageController});

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              SizedBox(height: 1.h),
              PrescriptionsAndVaccinationsSection(),
              TodaysMedicationsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
