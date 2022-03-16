
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_news/shared/components/article_builder.dart';
import 'package:app_news/shared/cubit/cubit.dart';
import 'package:app_news/shared/cubit/state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).business;
        return RefreshIndicator(
            child: articleBuilder(list,displayWidth,displayHeight),
          onRefresh: () async {NewsCubit().getBusiness();},
        );
      },
    );
  }
}
