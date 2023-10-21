import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/styles/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppUtils.isDarkMode(context)
          ? AppColors.primaryColor
          : AppColors.accentColor,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 18, right: 18, top: 5),
              title: const Text('Sender name'),
              subtitle: const Text('time'),
              leading: CircleAvatar(
                backgroundColor: AppUtils.isDarkMode(context)
                    ? AppColors.accentColor
                    : AppColors.primaryColor,
                child: Text(
                  AppUtils.generateAcronym("Winnie Parton"),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
              child: ReadMoreText(
                "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page,",
                trimLines: 2,
                colorClickableText: AppColors.accentColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' more',
                trimExpandedText: ' less',
                textAlign: TextAlign.start,
                moreStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                lessStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
