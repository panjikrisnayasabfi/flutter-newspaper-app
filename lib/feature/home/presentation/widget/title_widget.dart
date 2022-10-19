import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String value;

  const TitleWidget(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
    );
  }
}
