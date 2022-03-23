import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/services/app_states.dart';
import 'package:news_app/services/shared_prefs.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeTheme() {
    isDark = !isDark;
    SharedPrefs.saveTheme(isDark);
    emit(ChangeAppThemeState());
  }

  void getSavedTheme() {
    isDark = SharedPrefs.getTheme() ?? false;
    emit(ChangeAppThemeState1());
  }
}
