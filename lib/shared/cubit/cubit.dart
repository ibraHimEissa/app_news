import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:app_news/network/local/cache_helper.dart';
import 'package:app_news/network/remote/dio_helper.dart';
import 'package:app_news/shared/components/constants.dart';
import 'package:app_news/shared/cubit/state.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'2fd628a29c1e46ca9a739b2876d88a17',
      },
    ).then((value) {
      //print(value.data.toString());
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apiKey':'2fd628a29c1e46ca9a739b2876d88a17',
      },
    ).then((value) {
      //print(value.data.toString());
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports(){
    emit(NewsGetSportLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apiKey':'2fd628a29c1e46ca9a739b2876d88a17',
      },
    ).then((value) {
      //print(value.data.toString());
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportErrorState(error.toString()));
    });
  }

  List<dynamic> search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'2fd628a29c1e46ca9a739b2876d88a17',
      },
    ).then((value) {
      //print(value.data.toString());
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  void launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  int currentIndex = 0;
  void changeBottomNavBar(int index){
    currentIndex = index;
    if(index==0){
      getBusiness();
    }else if(index==1){
      getScience();
    }else if(index==2){
      getSports();
    }
    emit(NewsBottomNavState());
  }




}
