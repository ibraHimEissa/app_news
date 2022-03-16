import 'package:flutter/material.dart';
import 'package:app_news/shared/theme_cubit/theme_cubit.dart';

class NewsSearch extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.clear),
      ),
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),);
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text('Bla Bla');
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: ThemeCubit.get(context).themeMainColor,
        ));
  }

}
