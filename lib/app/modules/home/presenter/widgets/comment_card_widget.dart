import 'package:flutter/material.dart';

class CommentCardWidget extends StatelessWidget {
  const CommentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2023/12/19/16/08/butterfly-8457979_1280.jpg'),
            radius: 18,
          ),

          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'username',
                          style: const TextStyle(fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                            text: 'some description to insert',
            
                        ),
                      ]
                    )),
                    Padding(
                        padding:const EdgeInsets.only(top: 4),
                        child: Text('23/12/21',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                    )
                  ],
                ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.favorite,size: 16,),
          )

        ],
      ),
    );
  }
}
