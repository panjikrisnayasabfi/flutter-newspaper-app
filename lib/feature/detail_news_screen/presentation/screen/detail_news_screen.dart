import 'package:flutter/material.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';
import 'package:flutter_newspaper_app/core/utils/strings_util.dart';
import 'package:flutter_newspaper_app/feature/detail_news_screen/data/arguments_detail_news_model.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';

class DetailNewsScreen extends StatefulWidget {
  const DetailNewsScreen(this.argumentDetailNewsModel);
  final ArgumentDetailNewsModel argumentDetailNewsModel;

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget
                    .argumentDetailNewsModel
                    .articles[widget.argumentDetailNewsModel.index]
                    .urlToImage!),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      DSText(
                          data: widget
                              .argumentDetailNewsModel
                              .articles[widget.argumentDetailNewsModel.index]
                              .title,
                          textStyle: DSTextStyle.mediumStyle),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(Icons.person),
                          DSText(
                            data: widget
                                .argumentDetailNewsModel
                                .articles[widget.argumentDetailNewsModel.index]
                                .author,
                            textStyle: DSTextStyle.defaultStyle,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Icon(Icons.date_range),
                          DSText(
                            data: widget
                                .argumentDetailNewsModel
                                .articles[widget.argumentDetailNewsModel.index]
                                .publishedAt,
                            textStyle: DSTextStyle.defaultStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      DSText(
                        data: widget
                            .argumentDetailNewsModel
                            .articles[widget.argumentDetailNewsModel.index]
                            .description,
                        textStyle: DSTextStyle.regularStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0, left: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text('Back',
                      style: TextStyle(color: Colors.white, fontSize: 14))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
