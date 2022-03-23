import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';
import 'package:news_app/services/dio.dart';
import 'package:news_app/services/shared_prefs.dart';
import 'package:news_app/services/states.dart';

class NewsCubit extends Cubit<NewsAppStates> {
  NewsCubit() : super(NewsAppInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isDark = false;
  String selectedCountry = 'EG';
  List<Map<String, String>> countries = [
    {
      'Argentina': 'AR',
    },
    {
      'Australia': 'AU',
    },
    {
      'Brazil': 'BR',
    },
    {
      'China': 'CN',
    },
    {
      'Denmark': 'DK',
    },
    {
      'Egypt': 'EG',
    },
    {
      'France': 'FR',
    },
    {
      'Germany ': 'DE',
    },
    {
      'India ': 'IN',
    },
    {
      'Iraq ': 'IQ',
    },
    {
      'Italy ': 'IT',
    },
    {
      'Japan ': 'JP',
    },
    {
      'Republic of Korea': 'KR',
    },
    {
      'Saudi Arabia': 'SA',
    },
    {
      'Sweden': 'SE',
    },
    {
      'Switzerland ': 'CH',
    },
    {
      'Turkey  ': 'TR',
    },
    {
      'United Arab Emirates ': 'AE',
    },
  ];
  void changeSelectedCountry(value) {
    selectedCountry = value;
    emit(ChangeAppCountryState());
  }

  int currentCountryIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeScreen(index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());
  }

  void changeTheme() {
    isDark = !isDark;
    SharedPrefs.saveTheme(isDark).then((value) {
      emit(ChangeAppThemeState());
    });
  }

  void getSavedTheme() {
    isDark = SharedPrefs.getTheme() ?? false;
    emit(ChangeAppThemeState1());
  }

  bool getDark() {
    emit(ChangeAppThemeState());
    return isDark;
  }

  List business = [];
  List sports = [];
  List science = [];
  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_basketball),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
  ];
  List search = [];
  void getBusinessNews() {
    emit(GetBusinessNewsLoadingState());
    DioHelper.getData(url: METHODS, query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '$API_KEY',
    }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessNewsErrorState());
    });
  }

  void getSportsNews() {
    emit(GetSportsNewsLoadingState());
    DioHelper.getData(url: METHODS, query: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': '$API_KEY',
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportsNewsErrorState());
    });
  }

  void getSSearchedNews(value) {
    emit(SearchLoadingState());
    if (value == '') {
      search = [];
      emit(NewsSearchAppState());
    }
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '$API_KEY',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsSearchAppState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  void getScienceNews() {
    emit(GetScienceNewsLoadingState());
    DioHelper.getData(url: METHODS, query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '$API_KEY',
    }).then((value) {
      science = value.data['articles'];
      emit(GetScienceNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceNewsErrorState());
    });
  }
}
