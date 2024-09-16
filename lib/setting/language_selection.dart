import 'package:flutter/material.dart';
import 'package:news_app/theming/colors.dart';
import 'package:news_app/theming/theme.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           'Language',textAlign:TextAlign.start,
            style: MyThemeData.bodyMedium,
          ),
          SizedBox(height: 15,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.green, width: 1),
              borderRadius: BorderRadius.zero,
              color: Theme.of(context).cardTheme.color,
            ),
            child: Text(
              'English',
              style: MyThemeData.bodySmall,
            ),
          ),
        ],
      ),
    );
  }


}
