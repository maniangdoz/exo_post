import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/common/utils/app_validator.dart';
import 'package:exo_post/features/shared/presentation/button_shared.dart';
import 'package:exo_post/features/shared/presentation/text_field_shared.dart';
import 'package:exo_post/features/shared/presentation/text_label_shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();
  // bool _isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUtils.isDarkMode(context)
          ? AppColors.scaffoldBackgroundColorDark
          : AppColors.scaffoldBackgroundColorLight,
      body: Stack(
        children: <Widget>[
          AppUtils.firstPosition(context),
          AppUtils.secondPosition(context, "Login"),
          AppUtils.thirdPosition(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.onPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.fromLTRB(20, 300, 20, 15),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: <Widget>[
                        TextFieldShared(
                            controller: _emailTextFieldController,
                            icon: Icons.email,
                            labelText: "Email",
                            typeText: "Email",
                            maxLines: 1,
                            validator: AppValidors.emailValidtor),
                        TextFieldShared(
                            controller: _passwordTextFieldController,
                            icon: Icons.vpn_key,
                            labelText: "Password",
                            typeText: "Password",
                            maxLines: 1,
                            validator: AppValidors.passwordValidtor),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 15),
                    child: Column(
                      children: <Widget>[
                        ButtonShared(
                            text: "SIGN IN",
                            colorButton: AppUtils.isDarkMode(context)
                                ? AppColors.primaryColor
                                : AppColors.accentColor,
                            onClick: _doLogin)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextLabelShared(
                          colorTextLabel: AppUtils.isDarkMode(context)
                              ? AppColors.onPrimaryColor
                              : AppColors.greyColor,
                          labelText: "DON'T HAVE AN ACCOUNT ? ",
                          sizeLabelText: AppSizes.meduimText,
                          fontLabelText: FontWeight.w500,
                          onClick: () {}),
                      TextLabelShared(
                          colorTextLabel: AppUtils.isDarkMode(context)
                              ? AppColors.accentColor
                              : AppColors.primaryColor,
                          labelText: " SIGN UP",
                          sizeLabelText: AppSizes.meduimText,
                          fontLabelText: FontWeight.w700,
                          onClick: _goToRegisterPage),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _doLogin() {
    if (_formKey.currentState!.validate()) {
      String email = _emailTextFieldController.text.toString().trim();
      String password = _passwordTextFieldController.text.toString().trim();

      // widget.loginBloc.add(LoginEventDoLogin(
      //     loginRequest: LoginRequest(email: email, password: password)));
      String message = "email: ${email} password: $password";

      AppUtils.showAlert(
          context,
          "Login: $message",
          AppUtils.isDarkMode(context)
              ? AppColors.accentColor
              : AppColors.primaryColor);
    }
  }

  void _goToRegisterPage() {
    context.go(ScreenPaths.registerPage);
  }
}
