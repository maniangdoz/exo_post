import 'package:exo_post/common/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/styles/colors.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onBackgroundTap,
      child: Card(
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
              GestureDetector(
                onTap: _onContainerTap,
                child: Center(
                  child: ScaleTransition(
                    scale: _animation,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
                child: ReadMoreText(
                  "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, ",
                  trimLines: 2,
                  colorClickableText: AppColors.accentColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'more',
                  trimExpandedText: 'less',
                  textAlign: TextAlign.start,
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.comment_rounded)),
                    const Text('0'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onContainerTap() {
    setState(() {
      _isZoomed = !_isZoomed;
      if (_isZoomed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _onBackgroundTap() {
    if (_isZoomed) {
      setState(() {
        _isZoomed = false;
        _controller.reverse();
      });
    }
  }
}
