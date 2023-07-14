import 'package:newsapp/shared/bloc/cubit.dart';

abstract class NewsAppStates {}

class InitialNewsAppState extends NewsAppStates {}

class BottomNavBarState extends NewsAppStates {}

class ChangeBottomNavBarState extends NewsAppStates {}

class NewsGetBusinessSuccessState extends NewsAppStates {}

class NewsGetBusinessErrorState extends NewsAppStates {
  final String error;
  NewsGetBusinessErrorState(this.error);

}

class NewsGetBusinessLoadingState extends NewsAppStates {}

class NewsGetSportsSuccessState extends NewsAppStates {}

class NewsGetSportsErrorState extends NewsAppStates {
  final String error;
  NewsGetSportsErrorState(this.error);

}

class NewsGetSportsLoadingState extends NewsAppStates {}

class NewsGetScienceSuccessState extends NewsAppStates {}

class NewsGetScienceErrorState extends NewsAppStates {
  final String error;
  NewsGetScienceErrorState(this.error);

}

class NewsGetScienceLoadingState extends NewsAppStates {}

class changeModeAppState extends NewsAppStates {}

class NewsGetSearchSuccessState extends NewsAppStates {}

class NewsGetSearchErrorState extends NewsAppStates {

  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsAppGetSearchLoadingState extends NewsAppStates {}