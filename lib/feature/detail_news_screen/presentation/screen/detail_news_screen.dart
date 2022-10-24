import 'package:flutter/material.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';
import 'package:flutter_newspaper_app/feature/home/data/home_model.dart';

class DetailNewsScreen extends StatefulWidget {
  const DetailNewsScreen(this.article);
  final Article article;

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.article.urlToImage!),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      DSText(
                          data: widget.article.title,
                          textStyle: DSTextStyle.mediumStyle),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(Icons.person),
                          DSText(
                            data: widget.article.author,
                            textStyle: DSTextStyle.defaultStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range),
                          DSText(
                            data: widget.article.publishedAt,
                            textStyle: DSTextStyle.defaultStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      DSText(
                        data: widget.article.content,
                        textStyle: DSTextStyle.regularStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
