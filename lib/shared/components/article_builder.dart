import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'build_article_item.dart';

Widget articleBuilder(list,displayWidth,displayHeight) => BuildCondition(
  condition: list.isNotEmpty,
  builder: (context)=>
      ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=> buildArticleItem(displayWidth,displayHeight,list[index],context),
          separatorBuilder: (context,index) => const Padding(
            padding: EdgeInsetsDirectional.only(
              start: 24,
              end: 24,
            ),
            child: Divider(),
          ),
          itemCount: list.length),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);