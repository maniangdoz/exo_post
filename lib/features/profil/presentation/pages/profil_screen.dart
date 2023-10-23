import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: <Widget>[
        // AppUtils.firstPosition(context),
        // AppUtils.secondPosition(context, ""),
        // AppUtils.thirdPosition(context),
        Center(
          child: Text(
            'ProfilScreen is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
