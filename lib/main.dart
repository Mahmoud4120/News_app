import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/dio/dio_helper.dart';
import 'package:news_app/home/news_layout.dart';

import 'bloc_observers/observers.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state) {} ,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    color: Colors.white,
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    iconTheme: IconThemeData(color: Colors.black)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20,
                    backgroundColor: Colors.white,
                    selectedIconTheme: IconThemeData(
                      size: 35,
                    )),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                )), // light
            darkTheme: ThemeData(
                backgroundColor: HexColor('333739'),
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                    backgroundColor: HexColor('333739'),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    iconTheme: IconThemeData(color: Colors.white)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    elevation: 20,
                    backgroundColor: HexColor('333739'),
                    selectedIconTheme: IconThemeData(
                      size: 35,
                    )),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                )), // dark
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark, // change from dark to light
            home: Directionality(
                textDirection: TextDirection.ltr,
                child: NewsLayout()),
          );
        },
      ),
    );
  }
}
