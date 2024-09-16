import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../news/news_widget.dart';
import '../theming/colors.dart';

class NewsSearchDelegate extends SearchDelegate
{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: ()=> showResults(context), icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
   return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(future: ApiManager.SearchNews(query),
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
          return Center(child: CircularProgressIndicator(),);
        }

        var newsList = snapshot.data?.articles;
        return ListView.separated(itemBuilder: (context, index) {
          return NewsWidget(newsList?[index]);
        }, separatorBuilder: (context, index) =>
            SizedBox(height: 12,)
            , itemCount: newsList?.length ?? 0);
      },);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      appBarTheme:  AppBarTheme(
        backgroundColor: AppColors.green,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50))),),
    );
  }
}