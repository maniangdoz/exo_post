import 'package:exo_post/common/constants.dart';
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
          Positioned(
            right: -AppConstants.getSmallDiameter(context) / 3,
            top: -AppConstants.getSmallDiameter(context) / 3,
            child: Container(
              width: AppConstants.getSmallDiameter(context),
              height: AppConstants.getSmallDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.accentColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -AppConstants.getBiglDiameter(context) / 4,
            top: -AppConstants.getBiglDiameter(context) / 4,
            child: Container(
              width: AppConstants.getBiglDiameter(context),
              height: AppConstants.getBiglDiameter(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.accentColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: AppSizes.titleLabel,
                      color: AppColors.onPrimaryColor),
                ),
              ),
            ),
          ),
          Positioned(
            right: -AppConstants.getBiglDiameter(context) / 2,
            bottom: -AppConstants.getBiglDiameter(context) / 2,
            child: Container(
              width: AppConstants.getBiglDiameter(context),
              height: AppConstants.getBiglDiameter(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.onPrimaryColor),
            ),
          ),
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
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: AppColors.primaryColor,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors
                                        .scaffoldBackgroundColorLight)),
                            labelText: "Email",
                            enabledBorder: InputBorder.none,
                            labelStyle:
                                const TextStyle(color: AppColors.greyColor)),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.vpn_key,
                              color: AppColors.primaryColor,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors
                                        .scaffoldBackgroundColorLight)),
                            labelText: "Password",
                            enabledBorder: InputBorder.none,
                            labelStyle:
                                const TextStyle(color: AppColors.greyColor)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: AppSizes.heightButton,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.accentColor,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: AppColors.primaryColor,
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: AppColors.onPrimaryColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "DON'T HAVE AN ACCOUNT ? ",
                      style: TextStyle(
                          fontSize: AppSizes.meduimText,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      " SIGN UP",
                      style: TextStyle(
                          fontSize: AppSizes.meduimText,
                          color: AppConstants.isDarkMode(context)
                              ? AppColors.accentColor
                              : AppColors.primaryColor,
                          fontWeight: FontWeight.w700),
                    )
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
