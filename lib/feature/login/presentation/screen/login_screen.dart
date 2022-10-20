import 'package:flutter/material.dart';
import 'package:flutter_ds_bfi/flutter_ds_bfi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/strings_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  void _login() {
    if (_loginFormKey.currentState?.validate() ?? false) {
      if (_usernameController.text == Strings.admin &&
          _passwordController.text == Strings.admin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: DSText(data: Strings.loggingIn)),
        );
        // TODO: navigate to home screen for user
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: DSText(data: Strings.loginFailed),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _appTitleAndLogo() {
    return Row(
      children: [
        DSText(
          data: Strings.appTitle,
          textStyle: DSTextStyle.titleTextStyle,
        ),
        Spacer(),
        Image.asset(
          Strings.appLogoPath,
          width: 80.w,
          height: 80.w,
        ),
      ],
    );
  }

  Widget _textFormField(TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.pleaseFillThisField;
        }
        return null;
      },
    );
  }

  Widget _continueAsGuestButton() {
    return TextButton(
      onPressed: () {
        // TODO: navigate to home screen for guest
      },
      child: DSText(
        data: 'Continue as Guest',
        textStyle: DSTextStyle.defaultStyle.copyWith(
          color: DSColor.primaryBlue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: RPadding(
            padding: REdgeInsets.only(
              left: 16,
              right: 16,
              top: 64,
              bottom: 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appTitleAndLogo(),
                RSizedBox(
                  height: 16,
                ),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      _textFormField(
                        _usernameController,
                        Strings.username,
                      ),
                      RSizedBox(
                        height: 8,
                      ),
                      _textFormField(
                        _passwordController,
                        Strings.password,
                      ),
                    ],
                  ),
                ),
                RSizedBox(
                  height: 32,
                ),
                DSFilledButton(
                  text: 'Login',
                  buttonState: DSButtonState.Active,
                  onTap: () => _login(),
                ),
                RSizedBox(
                  height: 16,
                ),
                _continueAsGuestButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
