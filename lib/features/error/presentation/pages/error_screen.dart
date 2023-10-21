import 'package:exo_post/common/router.dart';
import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/features/shared/presentation/widgets/button_shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/something_wrong.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 230,
            left: 30,
            child: Text(
              'Dead End',
              style: TextStyle(
                color: AppUtils.isDarkMode(context)
                    ? AppColors.accentColor
                    : AppColors.primaryColor,
                fontSize: 25,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Positioned(
            bottom: 170,
            left: 30,
            child: Text(
              'Oops! The page you are looking for\nis not found',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 30,
            child: ButtonShared(
              text: "HOME",
              colorButton: AppUtils.isDarkMode(context)
                  ? AppColors.primaryColor
                  : AppColors.accentColor,
              onClick: _goBack,
            ),
          )
        ],
      ),
    );
  }

  void _goBack() {
    context.go(ScreenPaths.postPage);
  }
}
