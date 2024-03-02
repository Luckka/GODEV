import 'package:dart_either/dart_either.dart';
import 'package:flutter/material.dart';
import 'package:godev/app/core/shared/app_text_style.dart';
import 'package:godev/app/core/shared/user_info.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_event.dart';
import 'package:godev/app/modules/home/presenter/utils/like_animation.dart';
import 'package:intl/intl.dart';

class PostCardWidget extends StatefulWidget {
  final snap;
  final HomeBloc homeBloc;
  const PostCardWidget({super.key, required this.snap, required this.homeBloc});

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  bool isLikeAnimating = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4)
                .copyWith(right: 0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(widget.snap['postImage']),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.snap['username'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: ListView(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shrinkWrap: true,
                                    children: ['Delete']
                                        .map((e) => InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                            ))
                                        .toList()),
                              ));
                    },
                    icon: Icon(Icons.more_vert))
              ],
            ),
          ),
          GestureDetector(
            onDoubleTap: () async{
              widget.homeBloc.add(UpdateLikeEvent(uid: widget.snap['uid'], postId: widget.snap['postId'], likes: widget.snap['likes']));
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: Image.network(
                      widget.snap['postUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 120,
                    ),
                    isAnimating: isLikeAnimating,
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                    duration: const Duration(milliseconds: 400),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              LikeAnimation(
                smallLike: true,
                isAnimating:
                    widget.snap['likes'].contains(UserDate.instance.user?.uid),
                onEnd: () {},
                child: IconButton(
                    onPressed: () {
                      widget.homeBloc.add(UpdateLikeEvent(uid: widget.snap['uid'], postId: widget.snap['postId'], likes: widget.snap['likes']));
                    },
                    icon: widget.snap['likes'].contains(UserDate.instance.user?.uid) ?  const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ): const Icon(Icons.favorite_border)
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_outlined,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                  )),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: const Icon(Icons.bookmark_border), onPressed: () {}),
              ))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                    style: AppTextStyles.bodySmall,
                    child: Text(
                      '${widget.snap['likes'].length} likes',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: widget.snap['username'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' ${widget.snap['description']}',
                      ),
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'View all 200 comments',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
