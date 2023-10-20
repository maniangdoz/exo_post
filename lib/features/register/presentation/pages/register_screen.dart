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
  bool _isShowPassword = false;

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
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.onPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.fromLTRB(20, 300, 20, 15),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: <Widget>[
                        TextFieldShared(
                            controller: _nameTextFieldController,
                            icon: Icons.person,
                            labelText: "Name",
                            typeText: "Text",
                            maxLines: 1,
                            validator: AppValidors.nameValidtor),
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
                            text: "SIGNUP",
                            colorButton: AppUtils.isDarkMode(context)
                                ? AppColors.primaryColor
                                : AppColors.accentColor,
                            onClick: _doRegister)
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
      String message = "name: ${name}email: ${email} password: $password";
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
