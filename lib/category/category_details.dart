import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/tabs/tab_widget.dart';

class CategoryDetails extends StatelessWidget {
  Category category;
  CategoryDetails(this.category);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getSourcesByCategoryId(category.id),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(
            child: Column(
              children: [
                Text("Something went wrong ${snapshot.error.toString()}"),
                ElevatedButton(onPressed: (){}, child: Text("try again"))
              ],
            ),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          // loading,
          return const Center(child: CircularProgressIndicator(),);
        }
        var sources = snapshot.data?.sources;
        return TabWidget(sources);
      },
    );

  }
}