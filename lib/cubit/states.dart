

abstract class AppStates{}

class InitialState extends AppStates{}

class ChangeIndex extends AppStates{}

class ChangeThemeModeState extends AppStates{}

class ChangeBottomNavBar extends AppStates{}

class NewsGetBusinessLoadingState extends AppStates {}

class NewsGetBusinessSuccessState extends AppStates {}

class NewsGetBusinessErrorState extends AppStates {

  final String error ;
  NewsGetBusinessErrorState(this.error);




}


class NewsGetSportsLoadingState extends AppStates {}

class NewsGetSportsSuccessState extends AppStates {}

class NewsGetSportsErrorState extends AppStates {

  final String error ;
  NewsGetSportsErrorState(this.error);




}


class NewsGetScienceLoadingState extends AppStates {}

class NewsGetScienceSuccessState extends AppStates {}

class NewsGetScienceErrorState extends AppStates {

  final String error ;
  NewsGetScienceErrorState(this.error);




}

