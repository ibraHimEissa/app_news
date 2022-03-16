import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_news/shared/components/article_builder.dart';
import 'package:app_news/shared/components/build_article_item.dart';
import 'package:app_news/shared/components/default_text_form_field.dart';
import 'package:app_news/shared/cubit/cubit.dart';
import 'package:app_news/shared/cubit/state.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                DefaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'required';
                      }
                    },
                    label: 'Search',
                    prefix: Icons.search,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                )
                /*DefaultFormField(
                    inputType: TextInputType.text,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'required';
                      }
                    },
                    text: 'Search',
                    icon: Icons.search,
                    controller: searchController,
                    context: context,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    }
                ),*/
              ),
              articleBuilder(list, displayWidth, displayHeight),
            ],
          ),
        );
      },
    );
  }
}
