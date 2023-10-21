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
import '../../../shared/presentation/widgets/name_input.dart';
import '../../../shared/presentation/widgets/password_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextFieldController = TextEditingController();
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
          AppUtils.secondPosition(context, "Register"),
          AppUtils.thirdPosition(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  AuthRegisterContainer(
                    children: [
                      NameInput(
                          nameTextFieldController: _nameTextFieldController),
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
                      text: "SIGNUP",
                      colorButton: AppUtils.isDarkMode(context)
                          ? AppColors.primaryColor
                          : AppColors.accentColor,
                      onClick: _doRegister,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextLabelShared(
                          colorTextLabel: AppUtils.isDarkMode(context)
                              ? AppColors.onPrimaryColor
                              : AppColors.greyColor,
                          labelText: "ALREADY HAVE ON ACCOUNT ? ",
                          sizeLabelText: AppSizes.meduimText,
                          fontLabelText: FontWeight.w500,
                          onClick: () {}),
                      TextLabelShared(
                          colorTextLabel: AppUtils.isDarkMode(context)
                              ? AppColors.accentColor
                              : AppColors.primaryColor,
                          labelText: " LOGIN",
                          sizeLabelText: AppSizes.meduimText,
                          fontLabelText: FontWeight.w700,
                          onClick: _goToLoginPage),
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

  void _doRegister() {
    if (_formKey.currentState!.validate()) {
      String email = _emailTextFieldController.text.toString().trim();
      String name = _nameTextFieldController.text.toString().trim();
      String password = _passwordTextFieldController.text.toString().trim();
      String message = "name: $name email: $email password: $password";
      // widget.registerBloc.add(RegisterEventDoRegister(
      //     registerRequest: RegisterRequest(email: email, password: password)));
      AppUtils.showAlert(
          context,
          "Register: $message",
          AppUtils.isDarkMode(context)
              ? AppColors.accentColor
              : AppColors.primaryColor);
    }
  }

  void _goToLoginPage() {
    context.go(ScreenPaths.authPage);
  }
}
