 import 'package:flutter/material.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class MedicineDropdown extends StatelessWidget {
  final List<dynamic> medicines;
  final int? selectedMedicineId;
  final ValueChanged<int?> onChanged;
  final String? errorText;

  const MedicineDropdown({super.key, required this.medicines, required this.selectedMedicineId, required this.onChanged, this.errorText});

  @override
  Widget build(BuildContext context) {
    if (medicines.isEmpty) {
      return const SizedBox.shrink();
    }
    return DropdownButtonFormField<String>(
      value: selectedMedicineId?.toString(),
      items:
          medicines
              .map<DropdownMenuItem<String>>(
                (medicine) => DropdownMenuItem<String>(value: medicine.id.toString(), child: Text(medicine.enName ?? '')),
              )
              .toList(),
      onChanged: (value) {
        onChanged(int.tryParse(value!));
      },
      decoration: InputDecoration(
        labelText: S.of(context).select_medicine,
        labelStyle: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.cardBackground)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.cardBackground)),
        errorText: errorText,
      ),
    );
  }
}
