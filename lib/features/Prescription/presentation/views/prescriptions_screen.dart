import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/features/Prescription/presentation/cubit/prescription_cubit.dart';
import 'package:techmed/features/Prescription/presentation/widgets/prescription_list_tile.dart';
import 'package:techmed/features/Prescription/presentation/widgets/prescription_failure_refresh.dart';
import 'package:techmed/generated/l10n.dart';

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).vaccinations, style: AppTextStyles.poppins18Bold(context)),
        centerTitle: true,
        leading: IconButton(icon: Icon(FontAwesomeIcons.xmark), onPressed: () => Navigator.of(context).pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<PrescriptionCubit, PrescriptionState>(
                  buildWhen: (previous, current) {
                    return current is PrescriptionsLoading || current is PrescriptionsSuccess || current is PrescriptionsFailure;
                  },
                  builder: (context, state) {
                    if (state is PrescriptionsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PrescriptionsSuccess) {
                      if (state.prescriptions.data == null || state.prescriptions.data!.isEmpty) {
                        return Center(child: Text(S.of(context).no_prescriptions_found, style: AppTextStyles.poppins16Medium(context)));
                      }

                      return RefreshIndicator(
                        onRefresh: () => BlocProvider.of<PrescriptionCubit>(context).getPrescriptions(),
                        child: ListView.builder(
                          itemCount: state.prescriptions.data!.length,
                          itemBuilder: (context, index) {
                            final prescription = state.prescriptions.data![index];
                            return PrescriptionListTile(prescription: prescription);
                          },
                        ),
                      );
                    } else if (state is PrescriptionsFailure) {
                      return PrescriptionFailureRefresh(message: state.error);
                    }

                    return Center(child: Text("unknown state", style: AppTextStyles.poppins16Medium(context)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
