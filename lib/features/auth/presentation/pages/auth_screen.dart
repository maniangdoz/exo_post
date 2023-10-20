import 'package:exo_post/common/constants.dart';
import 'package:exo_post/common/shared/button_shared.dart';
import 'package:exo_post/common/shared/text_field_shared.dart';
import 'package:exo_post/common/shared/text_label_shared.dart';
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/styles/sizes.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.onPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(20, 300, 20, 15),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: const Column(
                    children: <Widget>[
                      TextFieldShared(icon: Icons.email, labelText: "Email"),
                      TextFieldShared(
                          icon: Icons.vpn_key, labelText: "Password"),
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
                          onClick: () {})
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
                        fontLabelText: FontWeight.w500),
                    TextLabelShared(
                        colorTextLabel: AppConstants.isDarkMode(context)
                            ? AppColors.accentColor
                            : AppColors.primaryColor,
                        labelText: " SIGN UP",
                        sizeLabelText: AppSizes.meduimText,
                        fontLabelText: FontWeight.w700),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
