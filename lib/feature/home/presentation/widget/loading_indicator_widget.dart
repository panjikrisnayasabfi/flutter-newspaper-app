import 'dart:developer';

import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('loading indicator widget built');
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
