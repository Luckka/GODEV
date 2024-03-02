import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:godev/app/modules/home/presenter/bloc/home_state.dart';
import 'package:godev/app/modules/home/presenter/widgets/post_card_widget.dart';

class FeedPage extends StatefulWidget {

  final HomeBloc homeBloc;

  const FeedPage({super.key, required this.homeBloc});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        title: Image.asset('assets/godev.png', height: 42,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.messenger_outline))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index) =>  PostCardWidget(
                snap: snapshot.data!.docs[index].data(), homeBloc: widget.homeBloc,
              ));
        }
      )

    );

  }
}
