
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science.dart';
import 'package:newsapp/modules/setting/setting.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'package:newsapp/shared/bloc/states.dart';

class NewsAppCubit extends Cubit<NewsAppStates>
{
  NewsAppCubit() : super(InitialNewsAppState());

  static NewsAppCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems  =
  [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science_outlined,
        ),
        label: 'Science'
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
}