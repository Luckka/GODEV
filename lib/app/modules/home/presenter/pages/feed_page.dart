import 'package:flutter/material.dart';
import 'package:godev/app/modules/home/presenter/widgets/post_card_widget.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

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
      body: const PostCardWidget(),
      
    );
    
  }
}
