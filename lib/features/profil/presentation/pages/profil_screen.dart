
import 'package:flutter/material.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../post/presentation/widgets/post_card.dart';
import '../../../shared/presentation/widgets/horizontal_dash.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppUtils.isDarkMode(context)
                          ? AppColors.accentColor
                          : AppColors.primaryColor,
                      child: Text(
                        AppUtils.generateAcronym("Sender name"),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sender name',
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
                          'email@email.com',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "My posts",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 2),
                              child: HorizontalDash(),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppUtils.isDarkMode(context)
                                  ? AppColors.accentColor
                                  : AppColors.primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8, left: 8, top: 5, bottom: 5),
                              child: Text(
                                "120 comments",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const PostCard(type: 'profil'),
              const PostCard(type: 'profil'),
              const SizedBox(
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
