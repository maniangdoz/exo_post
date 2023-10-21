import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/features/shared/presentation/widgets/button_shared.dart';
import 'package:exo_post/features/shared/presentation/widgets/text_label_shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/presentation/widgets/auth_register_container.dart';
import '../../../shared/presentation/widgets/email_input.dart';
import '../../../shared/presentation/widgets/password_input.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();

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
                  AuthRegisterContainer(
                    children: [
                      EmailInput(
                        emailTextFieldController: _emailTextFieldController,
                      ),
                      PasswordInput(
                        passwordTextFieldController:
                            _passwordTextFieldController,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                    child: ButtonShared(
                      text: "SIGN IN",
                      colorButton: AppUtils.isDarkMode(context)
                          ? AppColors.primaryColor
                          : AppColors.accentColor,
                      onClick: _doLogin,
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
                        onClick: _goToRegisterPage,
                      ),
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
      String message = "email: $email password: $password";

      AppUtils.showAlert(
          context,
          "Login: $message",
          AppUtils.isDarkMode(context)
              ? AppColors.accentColor
              : AppColors.primaryColor);
    }
  }

  void _goToRegisterPage() {
    context.go('${ScreenPaths.authPage}/${ScreenPaths.registerPage}');
  }
}
