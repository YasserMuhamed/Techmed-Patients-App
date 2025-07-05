import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:techmed/features/main/presentation/manager/cubit/bottom_nav_cubit_cubit.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/widgets/logo_widget.dart';
import 'package:techmed/features/main/presentation/pages/home_screen.dart';
import 'package:techmed/features/main/presentation/pages/schedule_screen.dart';
import 'package:techmed/features/medication/presentation/views/medication_screen.dart.dart';
import 'package:techmed/features/profile/presentation/pages/profile_screen.dart';
import 'package:techmed/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  late List<Widget> topLevelPages;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    topLevelPages = [
      HomeScreen(pageController: pageController),
      const MedicationScreen(),
      const ScheduleScreen(),
      const ProfileView(),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// on Page Changed
  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _mainWrapperAppBar(),
      body: _mainWrapperBody(),
      // bottomNavigationBar: _mainWrapperBottomNavBar(context),
      bottomNavigationBar: _bottomNav(context),
    );
  }

  BottomNavigationBar _bottomNav(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,

      currentIndex: context.watch<BottomNavCubit>().state,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.secondaryText,
      selectedLabelStyle: AppTextStyles.poppins12Medium(context),
      unselectedLabelStyle: AppTextStyles.poppins12Regular(
        context,
      ).copyWith(color: AppColors.secondaryText),
      onTap: (index) {
        BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(index);
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 10),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: AppColors.darkBackground,

          icon: Icon(IconlyLight.home),
          label: S.of(context).home,
          activeIcon: Icon(IconlyBold.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.heart),
          label: S.of(context).medication,
          activeIcon: Icon(IconlyBold.heart),
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.calendar),
          label: S.of(context).appointments,
          activeIcon: Icon(IconlyBold.calendar),
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.profile),
          label: S.of(context).profile,
          activeIcon: Icon(IconlyBold.profile),
        ),
      ],
    );
  }

  // App Bar - MainWrapper Widget
  AppBar _mainWrapperAppBar() {
    return AppBar(
      title: LogoText(fontSize: 18),
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  // Body - MainWrapper Widget
  Padding _mainWrapperBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: PageView(
        allowImplicitScrolling: true,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int page) => onPageChanged(page),
        controller: pageController,
        children: topLevelPages,
      ),
    );
  }
}
