import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techmed/Features/Main/presentation/widgets/home/todays_medications_section.dart';
import 'package:techmed/Features/Medication/presentation/manager/medication/medication_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PrescriptionsTabSection extends StatefulWidget {
  const PrescriptionsTabSection({super.key});

  @override
  State<PrescriptionsTabSection> createState() =>
      _PrescriptionsTabSectionState();
}

class _PrescriptionsTabSectionState extends State<PrescriptionsTabSection> {
  @override
  void initState() {
    BlocProvider.of<MedicationCubit>(context).getPrescriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationCubit, MedicationState>(
      buildWhen:
          (previous, current) =>
              (current is PrescriptionFailure ||
                  current is PrescriptionLoading ||
                  current is PrescriptionSuccess),
      builder: (context, state) {
        if (state is PrescriptionLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PrescriptionSuccess) {
          if (state.prescriptions.data!.isEmpty) {
            return const Center(child: Text('No Prescriptions'));
          }
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: state.prescriptions.data!.length,
              itemBuilder: (context, index) {
                return MedicationItem(
                  medicationName:
                      state.prescriptions.data![index].items![0].prescriptionId!
                          .toString(),
                  dosage: state.prescriptions.data![index].items![0].dosage!,

                  time:
                      state.prescriptions.data![index].items![0].timesPerDay!
                          .toString(),
                );
              },
            ),
          );
        } else if (state is PrescriptionFailure) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
