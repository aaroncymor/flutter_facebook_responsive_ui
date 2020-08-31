import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import '../config/palette.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop: _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}


class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  _HomeScreenMobile({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text('facebook', 
              style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.2
            )
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: (){},
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: (){},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(
            currentUser: currentUser
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index){
            final Post post = posts[index];
            return PostContainer(post: post);
          }),
        )
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {

  final TrackingScrollController scrollController;

  _HomeScreenDesktop({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(
                  currentUser: currentUser
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index){
                  final Post post = posts[index];
                  return PostContainer(post: post);
                }),
              )
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blue
          ),
        ),
      ],
    );
  }
}