import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/features/main/presentation/widgets/prescriptions_and_vaccinations_section.dart';
import 'package:techmed/features/main/presentation/widgets/todays_medications_section.dart';
import 'package:techmed/features/medication/presentation/manager/medication/medication_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [SliverToBoxAdapter(child: PrescriptionsAndVaccinationsSection())];
          },
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<MedicationCubit>().getMedications();
            },
            child: TodaysMedicationsSection(),
          ),
        ),
      ),
    );
  }
}
