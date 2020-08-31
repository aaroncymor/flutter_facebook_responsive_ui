import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

import '../config/palette.dart';

class Rooms extends StatelessWidget {
  
  final List<User> onlineUsers;

  Rooms({this.onlineUsers});
  
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop 
      ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
        )
      : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index){
            if (index == 0){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CreateRoomButton(),
              );
            }

            final User user = onlineUsers[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              )
            );
          }
        ),
      ),
    );
  }
}


class CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: ()=>print('Create room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.blueAccent,
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          // ShaderMask(
          //   shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
          //   child: Icon(Icons.video_call,
          //     size: 35.0,
          //     color: Colors.white,
          //   ),
          // ),
          Icon(Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          SizedBox(width: 4.0),
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}