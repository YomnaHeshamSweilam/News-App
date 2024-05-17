

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticle (article,context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:  DecorationImage(
              scale: 1,
                fit: BoxFit.cover,
                image:
                NetworkImage('${article['urlToImage']}'))
        ),
      ),
      const SizedBox(width: 15,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Expanded(child: Text('${article['title']}',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              )),
              Text('${article['publishedAt']}',
                  style: const TextStyle(
                      fontSize: 15,
                    color: Colors.grey,
                      fontWeight: FontWeight.w600
                  ),),
            ],
          ),
        ),
      )
    ],
  ),
);

Widget buildSeparator()=> const Divider(
  color: Colors.grey,
  thickness: 1,
  indent: 20,
  endIndent: 20,
  ) ;

Widget articleBuilder(list)=> ConditionalBuilder(
  condition: list.isNotEmpty ,
  builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index)=> buildArticle(list[index],context) ,
      separatorBuilder: (context,index)=> buildSeparator(),
      itemCount: 10),
  fallback: (context) => const Center(child: CircularProgressIndicator()),
);