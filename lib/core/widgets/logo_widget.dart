import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key, required this.fontSize});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'TECH',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: fontSize),
            ),
            TextSpan(
              text: 'MED',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
