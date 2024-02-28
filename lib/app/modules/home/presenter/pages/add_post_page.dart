import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/core/app_colors.dart';
import 'package:godev/app/core/shared/user_info.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_state.dart';

import '../bloc/home_event.dart';

class AddPostPage extends StatefulWidget {
  final HomeBloc homeBloc;
  const AddPostPage({super.key, required this.homeBloc});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => widget.homeBloc..add(InitialEvent()),
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final TextEditingController _descriptionControiller = TextEditingController();


    return widget.homeBloc.file == null
        ? Center(
            child: IconButton(
              icon: Icon(Icons.upload),
              onPressed: () {
                widget.homeBloc.add(SelectedImageEvent(context));
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              title: const Text('Post to'),
              actions: [
                TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      'Post',
                      style: TextStyle(
                          color: AppColors.blueTitle,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ],
            ),
            body: BlocBuilder<HomeBloc, HomeState>(
                bloc: widget.homeBloc,
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           CircleAvatar(
                            backgroundImage: NetworkImage(
                                UserDate.instance.user?.photoUrl ?? 'https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_1280.png'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child:  TextField(
                              controller: _descriptionControiller,
                              decoration: const InputDecoration(
                                  hintText: 'Write a caption...',
                                  border: InputBorder.none),
                              maxLines: 8,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 45,
                            child: AspectRatio(
                              aspectRatio: 487 / 451,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: MemoryImage(widget.homeBloc.file!),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter,
                                )),
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      )
                    ],
                  );
                }));
  }
}
