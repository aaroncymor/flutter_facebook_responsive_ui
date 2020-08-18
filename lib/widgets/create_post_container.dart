import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  CreatePostContainer({this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              SizedBox(width: 8.0,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What's on your mind?"
                  ),
                ),
              )
            ],
          ),
          Divider(height: 10.0, thickness: 0.5,),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.videocam,
                    color: Colors.red,
                  ),
                  onPressed: ()=> print('Live'),
                  label: Text('Live'),
                ),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                  icon: Icon(Icons.photo_library,
                    color: Colors.green,
                  ),
                  onPressed: ()=> print('Live'),
                  label: Text('Live'),
                ),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                  icon: Icon(Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  onPressed: ()=> print('Live'),
                  label: Text('Live'),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}

