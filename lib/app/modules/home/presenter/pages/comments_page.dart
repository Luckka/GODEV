import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:godev/app/core/shared/user_info.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_event.dart';

import '../widgets/comment_card_widget.dart';

class CommentsPage extends StatefulWidget {
  final HomeBloc homeBloc;
  final snap;
  const CommentsPage({super.key, required this.homeBloc, required this.snap});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: CommentCardWidget(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(UserDate.instance.user?.photoUrl ?? ''),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText:
                            "Comment as ${UserDate.instance.user?.username}",
                        border: InputBorder.none),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  widget.homeBloc.add(PostCommentEvent(
                      postId: widget.snap['postId'],
                      text: widget.snap['text'],
                      uid: UserDate.instance.user?.uid ?? '',
                      name: UserDate.instance.user?.username ?? '',
                      profilePic: UserDate.instance.user?.photoUrl ?? ''));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    "Post",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
