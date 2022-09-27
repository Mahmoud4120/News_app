import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';

import '../dio/dio_helper.dart';
import '../modules/business.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    // if(index == 1) {
    //   getSports();
    // }
    // if(index == 2) {
    //   getScience();
    // }
    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];

  void getBusiness() {

    emit(NewsBusinessLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsBusinessSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsBusinessErrorStates(error: error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsSportsLoadingStates());
    if(sports.length == 0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
          }).then((value) {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsSportsSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsSportsErrorStates(error: error.toString()));
      });
    }else{
      emit(NewsSportsSuccessStates());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsScienceLoadingStates());
    if(science.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
          }).then((value) {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsScienceSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsScienceErrorStates(error: error.toString()));
      });
    }else{
      emit(NewsScienceSuccessStates());
    }

  }

  bool isDark = false;
  void changeAppMode(){
    isDark =! isDark ;
    emit(NewsChangeModeStates());
  }
}
