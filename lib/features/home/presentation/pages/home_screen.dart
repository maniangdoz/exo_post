import 'dart:developer';

import 'package:exo_post/features/profil/presentation/pages/profil_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../post/presentation/pages/post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  final int index;
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _controller;

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
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    log('${widget.index}');
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostsApp'),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(text: 'Posts'),
            Tab(text: 'Profil'),
          ],
          onTap: (index) => _tap(context, index),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          PostScreen(),
          ProfilScreen(),
        ],
      ),
    );
  }

  _tap(BuildContext context, int index) => context.go('/home/$index');

  @override
  bool get wantKeepAlive => true;
}
