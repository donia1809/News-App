import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/theming/colors.dart';
import 'package:news_app/theming/theme.dart';

typedef OnClickSideMenu = void Function(SideMenuItemsEnum);

class HomeDrawer extends StatelessWidget {
  final OnClickSideMenu onClickSideMenu;
  HomeDrawer({required this.onClickSideMenu});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.06),
          color: AppColors.green,
          height: screenSize.height * .15,
          child: Text(
            'News App!',
            textAlign: TextAlign.center,
            style: MyThemeData.titleLarge,
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(left:screenSize.width* .03),
          child: InkWell(
            onTap: (){
              onClickSideMenu(SideMenuItemsEnum.categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.format_list_bulleted_outlined,
                  color: AppColors.black,
                  size: screenSize.height * 0.04,
                ),
                SizedBox(
                  width: screenSize.width * 0.02,
                ),
                Text('Categories',
                    style: MyThemeData.titleLarge.copyWith(color: AppColors.black)),
              ],
            ),
          ),
        ),
         SizedBox(height: screenSize.height*.015,),
        Padding(
          padding: EdgeInsets.only(left:screenSize.width* .03),
          child: InkWell(
            onTap: (){
              onClickSideMenu(SideMenuItemsEnum.settings);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: AppColors.black,
                  size: screenSize.height * 0.04,
                ),
                SizedBox(
                  width: screenSize.width * 0.02,
                ),
                Text(
                  'Settings',
                  style: MyThemeData.titleLarge.copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
