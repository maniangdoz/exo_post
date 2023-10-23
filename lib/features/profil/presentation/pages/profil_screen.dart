import 'package:exo_post/common/styles/colors.dart';
import 'package:exo_post/common/utils/app_utils.dart';
import 'package:exo_post/features/post/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';

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
                    const SizedBox(height: 5),
                    Text(
                      'email@email.com',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "120 comments",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Divider(
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ),
              Text(
                "My posts",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Divider(
                color: AppColors.greyColor,
              ),
              const SizedBox(height: 20),
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
