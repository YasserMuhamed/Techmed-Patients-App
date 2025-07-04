import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techmed/configs/theme/app_text_styles.dart';
import 'package:techmed/generated/l10n.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required TextEditingController genderController,
  }) : _genderController = genderController;

  final TextEditingController _genderController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).gender,
          style: AppTextStyles.poppins16Medium(context),
        ),
        DropdownMenu<String>(
          initialSelection:
              _genderController.text.isNotEmpty
                  ? _genderController.text
                  : S.of(context).male,
          textStyle: AppTextStyles.poppins16Regular(context),
          controller: _genderController,
          dropdownMenuEntries: [
            DropdownMenuEntry<String>(
              leadingIcon: Icon(FontAwesomeIcons.mars),
              value: S.of(context).male,
              label: S.of(context).male,
            ),
            DropdownMenuEntry<String>(
              leadingIcon: Icon(FontAwesomeIcons.venus),
              value: S.of(context).female,
              label: S.of(context).female,
            ),
          ],
          onSelected: (value) {
            if (value != null) {
              _genderController.text = value;
            }
          },
        ),
      ],
    );
  }
}
