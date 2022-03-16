import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:app_news/modules/search/search_delegate.dart';
import 'package:app_news/modules/search/search_screen.dart';
import 'package:app_news/network/remote/dio_helper.dart';
import 'package:app_news/shared/components/bottom_nav_bar.dart';
import 'package:app_news/shared/components/constants.dart';
import 'package:app_news/shared/components/navigate_to.dart';
import 'package:app_news/shared/cubit/cubit.dart';
import 'package:app_news/shared/cubit/state.dart';
import 'package:app_news/shared/theme_cubit/theme_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        ThemeCubit themeCubit = ThemeCubit.get(context);
        var newCubit = NewsCubit.get(context);
        double displayWidth = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App',),
            actions: [
              IconButton(
                  onPressed: (){
                    showSearch(context: context, delegate: NewsSearch());
                  },
                  icon: const Icon(Icons.search_rounded),
              ),
            ],
          ),
          body : screens[newCubit.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BottomNavBar(
                context,
                newCubit.currentIndex,
                displayWidth,
                bottomNavItems,
                bottomNavIcons),
          ),
        );
      },
    );
  }
}
