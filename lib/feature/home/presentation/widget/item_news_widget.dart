import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';

import '../../../../core/utils/route_util.dart';
import '../../../../core/utils/strings_util.dart';

class ItemNewsWidget extends StatelessWidget {
  const ItemNewsWidget({
    Key? key,
    required this.index,
    required this.homeModel,
    required this.isUser,
  }) : super(key: key);

  final int index;
  final HomeModel homeModel;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    log('item news widget built');
    return InkWell(
      key: Key('news_$index'),
      onTap: () {
        if (isUser) {
          Navigator.pushNamed(
            context,
            RouteUtil.detailNewsRoute,
            arguments: homeModel.article?[index],
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Card(
          child: ListTile(
            leading: Image.network(
              homeModel.article?[index].urlToImage ?? Strings.noImagePath,
              scale: 7,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(
              homeModel.article?[index].title ?? Strings.noText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              homeModel.article?[index].content ?? Strings.noText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
