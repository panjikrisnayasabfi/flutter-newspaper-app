import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';
import 'package:flutter_newspaper_app/feature/home/data/homeuserdata.dart';
import 'package:flutter_newspaper_app/feature/home/presentation/widget/item_news_widget.dart';

import 'login_badge_widget.dart';

class ListNewsWidget extends StatelessWidget {
  const ListNewsWidget({
    Key? key,
    required this.homeduserdata,
    required this.homeModel,
  }) : super(key: key);

  final Homeduserdata homeduserdata;
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    log('list news widget built');
    var isUser = homeduserdata.user == 'user';
    return Column(
      children: [
        if (!isUser) LoginBadgeWidget(),
        Expanded(
          child: ListView.builder(
            key: Key('list_news'),
            itemCount: homeModel.article?.length ?? 0,
            itemExtent: 160,
            itemBuilder: (context, index) {
              return ItemNewsWidget(
                homeModel: homeModel,
                index: index,
                isUser: isUser,
              );
            },
          ),
        ),
      ],
    );
  }
}
