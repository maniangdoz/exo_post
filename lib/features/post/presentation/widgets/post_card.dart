
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
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              contentPadding:
                  EdgeInsets.only(left: 18, right: 18, top: 5),
              title: Text('Sender name'),
              subtitle: Text('time'),
              leading: CircleAvatar(),
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 18, right: 18, top: 10, bottom: 10),
              child: ReadMoreText(
                '',
                trimLines: 2,
                colorClickableText: AppColors.primaryColor,
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
