import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:techmed/configs/theme/app_colors.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class VaccinationDetailsLoadingWidget extends StatelessWidget {
  const VaccinationDetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          Text(S.of(context).vaccination_name, style: AppTextStyles.poppins18Bold(context)),
          20.verticalSpace,
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(shape: BoxShape.rectangle, color: AppColors.dividerColor, borderRadius: BorderRadius.circular(8)),
                child: Icon(FontAwesomeIcons.syringe, color: AppColors.white),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vaccination Name',
                      style: AppTextStyles.poppins16Medium(context),
                      maxLines: null,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
          32.verticalSpace,
          Text(S.of(context).vaccination_date, style: AppTextStyles.poppins18Bold(context)),
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
