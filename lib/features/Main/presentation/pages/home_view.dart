import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/Features/Main/presentation/widgets/home/prescriptions_and_appointments_section.dart';
import 'package:techmed/Features/Main/presentation/widgets/home/todays_medications_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.pageController});

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
              PrescriptionsAndAppointmentsSection(
                pageController: pageController!,
              ),
              TodaysMedicationsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
