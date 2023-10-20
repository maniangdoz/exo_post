import 'package:exo_post/common/constants.dart';
import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/shared/button_shared.dart';
import 'package:exo_post/common/shared/text_field_shared.dart';
import 'package:exo_post/common/shared/text_label_shared.dart';
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextFieldController = TextEditingController();
  final _emailTextFieldController = TextEditingController();
  final _passwordTextFieldController = TextEditingController();
  bool _isLoading = false;
  bool _isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.isDarkMode(context)
          ? AppColors.scaffoldBackgroundColorDark
          : AppColors.scaffoldBackgroundColorLight,
      body: Stack(
        children: <Widget>[
          AppConstants.firstPosition(context),
          AppConstants.secondPosition(context, "Register"),
          AppConstants.thirdPosition(context),
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name must not be empty";
                              }
                              return null;
                            }),
                        TextFieldShared(
                            controller: _emailTextFieldController,
                            icon: Icons.email,
                            labelText: "Email",
                            typeText: "Email",
                            maxLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email must not be empty";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                                  .hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            }),
                        TextFieldShared(
                            controller: _passwordTextFieldController,
                            icon: Icons.vpn_key,
                            labelText: "Password",
                            typeText: "Password",
                            maxLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            }),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 40, 20, 15),
                    child: Column(
                      children: <Widget>[
                        ButtonShared(
                            text: "SIGNUP",
                            colorButton: AppConstants.isDarkMode(context)
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
                          colorTextLabel: AppConstants.isDarkMode(context)
                              ? AppColors.onPrimaryColor
                              : AppColors.greyColor,
                          labelText: "ALREADY HAVE ON ACCOUNT ? ",
                          sizeLabelText: AppSizes.meduimText,
                          fontLabelText: FontWeight.w500,
                          onClick: () {}),
                      TextLabelShared(
                          colorTextLabel: AppConstants.isDarkMode(context)
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
      AppConstants.showAlert(
          context,
          "Register: $message",
          AppConstants.isDarkMode(context)
              ? AppColors.accentColor
              : AppColors.primaryColor);
    }
  }

  void _goToLoginPage() {
    context.go(ScreenPaths.authPage);
  }
}
