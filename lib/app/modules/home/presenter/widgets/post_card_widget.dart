import 'package:flutter/material.dart';
import 'package:godev/app/core/shared/app_text_style.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

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
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_960_720.jpg'),
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
                        'username',
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/11/29/06/18/home-office-1867761_960_720.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
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
                    child:  IconButton(icon:const Icon(Icons.bookmark_border),onPressed: (){}),

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
                child: Text('1,231 likes', style: Theme.of(context).textTheme.bodyMedium,)),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(

                      children: [
                        TextSpan(
                          text: 'username',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' Hey this is some description to be repleaced',

                        ),
                      ]
                    ),
                  ),
                ),
                
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text('View all 200 comments',style: TextStyle(fontSize: 16,color: Colors.grey),),
                  
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text('22/12/2024',style: TextStyle(fontSize: 16,color: Colors.grey),),

                ),

              ],
              
            ),
          )

        ],
      ),
    );
  }
}
