
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';



Widget buildArticleItem(article , context)=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                    '${article ['urlToImage']} '),
                fit: BoxFit.cover
            )),
      ),
      SizedBox(width: 20),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text( '${article ['title']} ',
                  maxLines: 4,
                  overflow:TextOverflow.ellipsis ,
                  style: Theme.of(context).textTheme.bodyText1),
              ),
              Text( '${article ['publishedAt']} ',
                style: TextStyle(
                    color: Colors.grey
                ),),
            ],
          ),
        ),
      )
    ],
  ),
);

Widget MyDivider ()=>Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[300],
);
Widget articleBuilder (list , context)=> ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          buildArticleItem(list[index] , context),
      separatorBuilder: (context, index) => MyDivider(),
      itemCount: 10,
    ),
    fallback: (context) => Center(child: CircularProgressIndicator(
      color:Colors.deepOrange ,),
    ));