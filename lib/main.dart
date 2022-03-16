// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_news/layout/home_layout.dart';
import 'package:app_news/shared/bloc_observer.dart';
import 'package:app_news/shared/cubit/cubit.dart';
import 'package:app_news/shared/theme_cubit/theme_cubit.dart';
import 'package:app_news/shared/theme_cubit/theme_state.dart';

import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  bool? isDark = CacheHelper.getDate(key: 'isDark');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()),
        BlocProvider(create: (BuildContext context) => ThemeCubit()..changeAppMode(
          fromShared: isDark,
        )),
      ],
      child: BlocConsumer<ThemeCubit,ThemeStates>(
        listener: (context,state){},
        builder: (context,state){
          isDark ??= ThemeCubit.get(context).isDark;
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor:  ThemeCubit.get(context).themeMainColor,
              appBarTheme: AppBarTheme(
                backgroundColor: ThemeCubit.get(context).themeMainColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ThemeCubit.get(context).themeMainColor,
                  statusBarIconBrightness: Brightness.light,
                ),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: ThemeCubit.get(context).themeMainColor,
              appBarTheme: AppBarTheme(
                backgroundColor: ThemeCubit.get(context).themeMainColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ThemeCubit.get(context).themeMainColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
            ),
            themeMode: ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
