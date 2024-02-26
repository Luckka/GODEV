import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/core/app_colors.dart';
import 'package:godev/app/core/shared/user_info.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_event.dart';

import '../bloc/home_state.dart';
import '../utils/navigation_tap.dart';

class HomePage extends StatefulWidget {
  final HomeBloc homeBloc;
  const HomePage({super.key, required this.homeBloc});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => widget.homeBloc..add(InitialEvent()),
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  void onPageChanged(int page){

    setState(() {
      widget.homeBloc.pageSelected = page;
    });

  }



  Widget _buildPage(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: widget.homeBloc,
        builder: (context, state) {
          if (state is HomeStateInit) {
            widget.homeBloc.pageController = PageController();

          }

          // if(state is HomeChangePage){
          //   widget.homeBloc.onPageChanged(widget.homeBloc.pageSelected);
          // }
          return PageView(
            children: [
              Text('test1'),
              Text('test2'),
              Text('test3'),
              Text('test4'),
              Text('test5'),
            ],
            controller: widget.homeBloc.pageController,
            onPageChanged: onPageChanged,
          );
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: widget.homeBloc.pageSelected == 0
                    ? AppColors.green
                    : AppColors.white,
              ),
              label: '',
              backgroundColor: AppColors.subtitleText),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: widget.homeBloc.pageSelected == 1
                    ? AppColors.green
                    : AppColors.white,
              ),
              label: '',
              backgroundColor: Colors.amber),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: widget.homeBloc.pageSelected == 2
                    ? AppColors.green
                    : AppColors.white,
              ),
              label: '',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: widget.homeBloc.pageSelected == 3
                    ? AppColors.green
                    : AppColors.white,
              ),
              label: '',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: widget.homeBloc.pageSelected == 4
                    ? AppColors.green
                    : AppColors.white,
              ),
              label: '',
              backgroundColor: Colors.amber),
        ],
        onTap:(page){
          widget.homeBloc.add(HomePageChangeEvent(page));
          widget.homeBloc.navigationTap(page);

        }
      ),
    );
  }
}
