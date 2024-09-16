import 'package:flutter/material.dart';

import 'language_selection.dart';

class SettingFragment extends StatelessWidget {
  static const String routeName = 'settings_screen';
  const SettingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        LanguageSelection(),
      ],
    );
  }
}
