import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techmed/Features/Medication/presentation/manager/medication/medication_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedicationTabSection extends StatefulWidget {
  const MedicationTabSection({super.key});

  @override
  State<MedicationTabSection> createState() => _MedicationTabSectionState();
}

class _MedicationTabSectionState extends State<MedicationTabSection> {
  @override
  void initState() {
    BlocProvider.of<MedicationCubit>(context).getMedications();
    super.initState();
  }

  // Future<void> getToken() async {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicationCubit, MedicationState>(
      buildWhen:
          (previous, current) =>
              (current is MedicationLoading ||
                  current is MedicationSuccess ||
                  current is MedicationFailure),
      builder: (context, state) {
        if (state is MedicationLoading) {
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return MedicationItem(
                  medicineName: "Zincovit",
                  dosage: "200mg",
                  activeIngredients: "Zinc, Vitamin C",
                  notes: "Take 2 times a day",
                );
              },
            ),
          );
        } else if (state is MedicationSuccess) {
          if (state.medications.data!.isEmpty) {
            return const Center(child: Text('No Medications'));
          }
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: state.medications.data!.length,
              itemBuilder: (context, index) {
                return MedicationItem(
                  medicineName:
                      state.medications.data![index].medicine!.enName!,
                  dosage: state.medications.data![index].dosage!,
                  activeIngredients:
                      state
                          .medications
                          .data![index]
                          .medicine!
                          .activeIngredients!,
                  notes: state.medications.data![index].notes!,
                );
              },
            ),
          );
        } else if (state is MedicationFailure) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class MedicationItem extends StatelessWidget {
  const MedicationItem({
    super.key,
    required this.medicineName,
    required this.dosage,
    required this.activeIngredients,
    required this.notes,
  });

  final String medicineName;
  final String dosage;
  final String activeIngredients;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Medicine Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withAlpha(25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.medical_services,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            // Medicine Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Medicine Name
                  Text(
                    medicineName, // Extracted from medicine.enName
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Dosage
                  Row(
                    children: [
                      Icon(
                        Icons.bar_chart,
                        size: 16,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Dosage: $dosage", // Extracted from dosage
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Active Ingredients
                  Row(
                    children: [
                      Icon(
                        Icons.science,
                        size: 16,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        activeIngredients, // Extracted from medicine.activeIngredients
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Notes
                  Row(
                    children: [
                      Icon(
                        Icons.note,
                        size: 16,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        notes, // Extracted from notes
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
