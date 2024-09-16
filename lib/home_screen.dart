import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/search/search_delegate.dart';
import 'package:news_app/setting/setting-fragment.dart';
import 'package:news_app/theming/colors.dart';
import 'package:news_app/theming/theme.dart';
import 'package:news_app/category/category_fragment.dart';
import 'home_drawer.dart';
import '../model/category.dart';

class HomeScreen extends StatefulWidget
{
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
     var screenSize =  MediaQuery.of(context).size;
   return Stack(
     children: [
       Container(
     color: Colors.white,
     child: Image.asset(
       'assets/main_background.png',
       width: double.infinity,
       height: double.infinity,
       fit: BoxFit.cover,
     ),
   ),
       Scaffold(
         backgroundColor: Colors.transparent,
         drawer: HomeDrawer(
           onClickSideMenu:  onSideMenuClick,),
         appBar: AppBar(
           actions: [
             IconButton(onPressed: (){ NewsSearchDelegate(); },
                 icon: Icon(Icons.search,size: 30,))
           ],
           title: Text('News App',
           style: MyThemeData.titleMedium),
           backgroundColor: AppColors.green,
           centerTitle: true,
           shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.vertical(
               bottom: Radius.circular(50)
             )
           ),
           leadingWidth:screenSize.width*.2
       ),
         body:  selectedSideMenu == SideMenuItemsEnum.settings
             ? const SettingFragment()
             : selectedCategory == null
             ? CategoryFragment(
           onCategoryClickCallBack: onCategoryClick,
         )
             : CategoryDetails(selectedCategory!),
       )],
   );
  }

  SideMenuItemsEnum selectedSideMenu = SideMenuItemsEnum.categories ;

  void onSideMenuClick(SideMenuItemsEnum newSideMenuItems) {
    selectedSideMenu = newSideMenuItems;
    Navigator.of(context).pop();
    selectedCategory = null;
    setState(() {});
  }

  Category? selectedCategory;
  void onCategoryClick(Category category) {
    selectedCategory = category;
    setState(() {});
  }
}

enum SideMenuItemsEnum { categories, settings }