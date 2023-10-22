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
      duration: const Duration(milliseconds: 50),
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
            ? Colors.black
            : AppColors.primaryColor,
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
                      ? AppColors.primaryColor
                      : AppColors.accentColor,
                  child: Text(
                    AppUtils.generateAcronym("Sender name"),
                    style: TextStyle(
                      color: AppUtils.isDarkMode(context)
                          ? AppColors.accentColor
                          : AppColors.scaffoldBackgroundColorDark,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _onContainerTap,
                child: Center(
                  child: ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'assets/images/something_wrong.png',
                        fit: BoxFit.cover,
                        height: _isZoomed
                            ? MediaQuery.of(context).size.height * 0.6
                            : 150,
                        width: double.infinity,
                      )),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
                child: ReadMoreText(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mode_comment),
                  ),
                  const Text(
                    '12', // Replace with the actual number of comments
                  ),
                  const SizedBox(width: 10), // Adjust the width as needed
                ],
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
