import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';

import '../../../../core/utils/route_util.dart';
import '../../../../core/utils/strings_util.dart';

class LoginBadgeWidget extends StatelessWidget {
  const LoginBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('login badge built');
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: EdgeInsets.only(left: 8, top: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DSText(
            data: Strings.andaMasukSebagaiGuest,
            textStyle: DSTextStyle.regularStyle.copyWith(color: Colors.white),
          ),
          InkWell(
            key: Key('guest_login_badge'),
            onTap: () => Navigator.pushNamed(context, RouteUtil.loginRoute),
            child: DSText(
              data: 'Login',
              textStyle: DSTextStyle.regularStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
