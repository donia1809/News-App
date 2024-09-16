import 'package:flutter/material.dart';
import 'package:news_app/theming/colors.dart';
import '../model/category.dart';
import 'category_item.dart';

typedef OnCategoryClickCallBack = void Function(Category);

class CategoryFragment extends StatelessWidget{
  static const String routeName = 'category';

  final OnCategoryClickCallBack? onCategoryClickCallBack;

  CategoryFragment({ super.key,
     this.onCategoryClickCallBack,
  });
  var categoryList = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    var screenSize =  MediaQuery.of(context).size;

    return Container(
      padding:EdgeInsets.only(
          top: screenSize.height*0.03,
          left:  screenSize.height*0.02,
          right: screenSize.height*0.02,  ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category\nof interest',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grey
              )),
          SizedBox(height: screenSize.height*0.04,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 2,  mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: ( context, index) {
                return InkWell(
                    onTap: (){
                      onCategoryClickCallBack!(categoryList[index]);
                    },
                    child: CategoryItem(
                      category: categoryList[index],
                      index: index,));
              },
            itemCount: categoryList.length,),
          )
        ],
      )

    );
  }
}
