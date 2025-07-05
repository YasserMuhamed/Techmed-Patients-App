import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/core/constants/assets.dart';
import 'package:techmed/core/widgets/svg_ic_container.dart';
import 'package:techmed/generated/l10n.dart';

class MedicationDetailsLoadingWidget extends StatelessWidget {
  const MedicationDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          Text(S.of(context).medication, style: AppTextStyles.poppins18Bold(context)),
          20.verticalSpace,
          Row(
            children: [
              SvgICContainer(svgPath: Assets.assetsSvgsMedicine),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medication Name',
                      style: AppTextStyles.poppins16Medium(context),
                      maxLines: null,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      S.of(context).dosage_variable('500mg'),
                      style: AppTextStyles.poppins14Regular(context).copyWith(color: AppColors.secondaryText),
                      maxLines: null,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
          28.verticalSpace,
          Text(S.of(context).dosage, style: AppTextStyles.poppins18Bold(context)),
          28.verticalSpace,
          Text(S.of(context).notes, style: AppTextStyles.poppins16Regular(context)),
          32.verticalSpace,
          Text(S.of(context).start_date, style: AppTextStyles.poppins18Bold(context)),
          32.verticalSpace,
          Text("July 15, 2023", style: AppTextStyles.poppins16Regular(context)),
          32.verticalSpace,
          Text(S.of(context).end_date, style: AppTextStyles.poppins18Bold(context)),
          32.verticalSpace,
          Text("July 15, 2023", style: AppTextStyles.poppins16Regular(context)),
          32.verticalSpace,
          Text(S.of(context).notes, style: AppTextStyles.poppins18Bold(context)),
          32.verticalSpace,
          Text("Take with food aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", style: AppTextStyles.poppins16Regular(context)),
        ],
      ),
    );
  }
}
