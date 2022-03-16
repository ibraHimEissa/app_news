import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:app_news/network/local/cache_helper.dart';
import 'package:app_news/shared/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(NewsInitialState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = true;
  ThemeMode appMode = ThemeMode.dark;
  Color mainColor = Colors.deepOrange;
  Color mainColor2 = Colors.white;
  Color themeMainColor = Colors.white;

  void changeAppMode({bool? fromShared}){
    if (isDark){
      appMode = ThemeMode.light;
      mainColor2 = HexColor('3B538DFF');
      themeMainColor = HexColor('152238');
      isDark = false;
      CacheHelper.putDate(key: 'isDark', value: isDark).then((value){
        emit(NewsAppChangeModeState());
      });
    }else{
      appMode = ThemeMode.dark;
      mainColor2 = Colors.white;
      themeMainColor = Colors.white;
      isDark = true;
      CacheHelper.putDate(key: 'isDark', value: isDark).then((value){
        emit(NewsAppChangeModeState());
      });

    }
  }

}