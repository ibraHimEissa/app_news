import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_news/shared/cubit/cubit.dart';
import 'package:app_news/shared/theme_cubit/theme_cubit.dart';

import 'constants.dart';

Widget buildArticleItem(double displayWidth,double displayHeight, article,context) => InkWell(
  onTap:(){
    NewsCubit.get(context).launchURL(article['url']);
  },
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.center,
  
    children: [
  
      Stack(
  
        alignment: AlignmentDirectional.bottomEnd,
  
        children: [
  
          //NewsPhotoContainer
  
          Container(
  
            width: displayWidth/1.08,
  
            height: displayHeight/2.727,
  
            decoration: BoxDecoration(
  
              borderRadius: BorderRadius.circular(10.0),
  
              image: DecorationImage(
  
                image: NetworkImage('${article['urlToImage'] ?? 'https://us.123rf.com/450wm/alhovik/alhovik1709/alhovik170900031/86481591-breaking-news-background-world-global-tv-banner-pubblicitari.jpg?ver=6'}'),
  
                fit: BoxFit.cover,
  
              ),
  
            ),
  
          ),
  
          //Container News Details
  
          Padding(
  
            padding: const EdgeInsets.all(8.0),
  
            child: Stack(
  
              children: [
  
                Container(
  
                  width: displayWidth/1.13,
  
                  height: displayHeight/7.031,
  
                  decoration: BoxDecoration(
  
                    borderRadius: BorderRadius.circular(10.0),
  
                    color:  ThemeCubit.get(context).themeMainColor.withAlpha(500),
  
                  ),
  
                ),
  
                Column(
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  mainAxisSize: MainAxisSize.min,
  
                  children: [
  
                    //DateText
  
                    Padding(
  
                      padding: const EdgeInsets.only(left: 8.0,top: 8.0),
  
                      child: Text(
  
                        '${article['publishedAt']}',
  
                        textAlign: TextAlign.start,
  
                        style: TextStyle(
  
                          fontSize: 10,
  
                          color: Colors.grey,
  
                          fontWeight: FontWeight.bold,
  
                        ),
  
                      ),
  
                    ),
  
                    //TitleText
  
                    SizedBox(
  
                      width: displayWidth/1.13,
  
                      child: Padding(
  
                        padding: const EdgeInsets.only(top: 10.0,left: 8.0,right: 8.0),
  
                        child: Text(
  
                          '${article['title']}',
  
                          textAlign: TextAlign.end,
  
                          maxLines: 2,
  
                          overflow: TextOverflow.ellipsis,
  
                          style: TextStyle(
  
                            fontSize: 13,
  
                            color:  ThemeCubit.get(context).mainColor,
  
                            fontWeight: FontWeight.bold,
  
                          ),
  
                        ),
  
                      ),
  
                    ),
  
                  ],
  
                ),
  
              ],
  
            ),
  
          ),
  
          //FavFloatingButton

          Positioned(
            right: displayWidth/7,
            bottom: displayHeight/9.2,
            child: FloatingActionButton(
  
              elevation: 0.0,
  
              onPressed: (){},
  
              backgroundColor:  ThemeCubit.get(context).themeMainColor.withAlpha(500),
  
              child: Icon(Icons.favorite_border,color:  ThemeCubit.get(context).mainColor,),
  
            ),
          ),
  
        ],
  
      ),
  
    ],
  
  ),
);