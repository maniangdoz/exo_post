import 'package:exo_post/common/constants.dart';
import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/shared/button_shared.dart';
import 'package:exo_post/common/shared/text_field_shared.dart';
import 'package:exo_post/common/shared/text_label_shared.dart';
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:exo_post/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
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
          AppConstants.secondPosition(context, "Login"),
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
                            text: "SIGN IN",
                            colorButton: AppConstants.isDarkMode(context)
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
                          colorTextLabel: AppConstants.isDarkMode(context)
                              ? AppColors.onPrimaryColor
                              : AppColors.greyColor,
                          labelText: "DON'T HAVE AN ACCOUNT ? ",
                          sizeLabelText: AppSizes.meduimText,
                          fontLabelText: FontWeight.w500,
                          onClick: () {}),
                      TextLabelShared(
                          colorTextLabel: AppConstants.isDarkMode(context)
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
      print("password " + password);
      print("email " + email);
      // widget.loginBloc.add(LoginEventDoLogin(
      //     loginRequest: LoginRequest(email: email, password: password)));
    }
  }

  void _goToRegisterPage() {
    Navigator.pushReplacementNamed(context, ScreenPaths.registerPage);
  }

  void _showAlert(String message) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("OK"))
            ],
          );
        });
  }
}
