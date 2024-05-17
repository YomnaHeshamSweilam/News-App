import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';

import '../Screens/business_screen.dart';
import '../Screens/science_screen.dart';
import '../Screens/sports_screen.dart';
import '../network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super (InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens =[
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),

  ];
  List<BottomNavigationBarItem> bottomItems =[
    const BottomNavigationBarItem (icon: Icon(Icons.business_center_outlined),label: 'Business'),
    const BottomNavigationBarItem (icon: Icon(Icons.sports_baseball_outlined),label: 'Sports'),
    const BottomNavigationBarItem (icon: Icon(Icons.science_outlined), label: 'Science'),
  ];

  List <dynamic> business =[];
  List <dynamic> sports =[];
  List <dynamic> science =[];
  // bool isDark = false;

  void changeIndex(int index)
  {
    currentIndex = index;
    if (index == 1)
      {
        getSportsData();
      }
    if(index ==2)
      {
        getScienceData();
      }
    emit(ChangeIndex());
  }

//   void changeThemeMode()
// {
//  isDark = !isDark;
//  CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
//  {
//    emit(ChangeThemeModeState());
//  });
//
// }

  void getBusinessData()
  {

    //https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData('/v2/everything',
        {'q': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',}).then((
        value) {
            business = value.data['articles'] ;
            emit(NewsGetBusinessSuccessState());
            //65f7f556ec76449fa7dc7c0069f040ca

    }).catchError((error){
      print(error.toString());
    });
        }

  void getSportsData()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.isEmpty)
    {
      DioHelper.getData('/v2/everything',
          {'q': 'sports',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',}).then((
          value) {
        sports = value.data['articles'] ;
        emit(NewsGetSportsSuccessState());

      }).catchError((error){
        print(error.toString());
      });
    }
    else {
      emit(NewsGetSportsSuccessState());
    }

  }

  void getScienceData()
  {
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty)
      {
        DioHelper.getData('/v2/everything',
            {'q': 'science',
              'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',}).then((
            value) {
          science = value.data['articles'] ;
          emit(NewsGetScienceSuccessState());

        }).catchError((error){
          print(error.toString());
        });
      }
    else{
      emit(NewsGetScienceSuccessState());
    }
  }


}


