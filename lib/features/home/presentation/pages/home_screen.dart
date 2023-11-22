import 'package:exo_post/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/app_utils.dart';
import '../../../post/presentation/pages/post_screen.dart';
import '../../../profil/presentation/pages/profil_screen.dart';
import '../../../shared/presentation/widgets/button_shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  final int index;
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("X Like"),
        backgroundColor: AppUtils.blackprimaryColor(context),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(text: 'Posts'),
            Tab(text: 'Profil'),
          ],
          onTap: (index) => _tap(index),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          const PostScreen(),
          _displayUnauthorized(),
        ],
      ),
    );
  }

  Widget _displayUnauthorized() {
    return FutureBuilder<int>(
      future: _verifyAuthorization(1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          int number = snapshot.data ?? 0;
          if (number == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppConstants.messageError401,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                    child: ButtonShared(
                      text: "Go to Posts",
                      colorButton: AppColors.primaryColor,
                      onClick: () {
                        _tap(0);
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return const ProfilScreen();
          }
        }
      },
    );
  }

  _tap(int index) async {
    int number = await _verifyAuthorization(index);

    _redirectPath(number);
  }

  _redirectPath(int index) {
    context.go('/home/$index');
  }

  Future<int> _verifyAuthorization(int index) async {
    bool isValidToken = await AppUtils.isAuthTokenValid();
    if (index == 0 || (index > 0 && isValidToken)) {
      return index;
    } else {
      return 0;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
