import 'package:flutter/material.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';

class InfoUser extends StatefulWidget {
  final int idUser;

  const InfoUser({super.key, required this.idUser});

  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  String name = "Sender name";
  String email = 'email@email.com';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 50,
            backgroundColor: AppUtils.accentprimaryColor(context),
            child: Text(
              AppUtils.generateAcronym(name),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mail_rounded,
                color: AppColors.greyColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
