import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  ' News app '
              ),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search_sharp)),
                IconButton(
                    onPressed: (){
                      NewsCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined,)),
              ],
            ),
            body: cubit.screens[cubit.currentIndex] ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
              items:cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
