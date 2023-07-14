
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science.dart';
import 'package:newsapp/modules/setting/setting.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'package:newsapp/shared/bloc/states.dart';
import 'package:newsapp/shared/network/local/cach_helper.dart';

import '../network/remote/dio.dart';

class NewsAppCubit extends Cubit<NewsAppStates>
{
  NewsAppCubit() : super(InitialNewsAppState());

  static NewsAppCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems  =
  [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.car_crash,
        ),
        label: 'Tesla'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Toyota'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science_outlined,
        ),
        label: 'BMW'
    ),
  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  List<dynamic> business = [];

  void getBusinessData()
  {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'tesla',
          'from':'2023-06-13',
          'sortBy':'publishedAt',
          'apiKey':'c4c9f4ddc89d4c6da21f8337ae191838',
        }
    ).then((value){
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print("Error: $error");
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSportsData()
  {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'toyota',
          'from':'2023-06-13',
          'sortBy':'publishedAt',
          'apiKey':'c4c9f4ddc89d4c6da21f8337ae191838',
        }
    ).then((value){
      sports = value?.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print("Error: $error");
      emit(NewsGetSportsErrorState(error));
    });
  }

  List<dynamic> science = [];

  void getScienceData()
  {
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'bmw',
          'from':'2023-06-13',
          'sortBy':'publishedAt',
          'apiKey':'c4c9f4ddc89d4c6da21f8337ae191838',
        }
    ).then((value){
      science = value?.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print("Error: $error");
      emit(NewsGetScienceErrorState(error));
    });
  }

  bool isDark = false;

  void changeAppMode({fromShared})
  {
    if(fromShared != null){
      isDark = fromShared;
    }else{
      if(isDark == false){
        isDark= true;
      }else{
        isDark = false;
      }
    }
    CacheHelper.putData(key: 'isDark', value: isDark).then((value){
      print(isDark);
      emit(changeModeAppState());
    });

  }
}