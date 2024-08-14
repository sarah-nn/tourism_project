import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/theme/app_theme_state.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/data/models/themestate.dart';

// part 'app_theme_state.dart';
class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.Initial:
        if (CacheHelper().getData(key: 'theme') != null) {
          if (CacheHelper().getData(key: 'theme') == 'l') {
            emit(AppLightTheme());
          } else {
            emit(AppDarkTheme());
          }
        }
        break;
      case ThemeState.Light:
        {
          CacheHelper().saveData(key: 'them', value: 'l');

          emit(AppLightTheme());
        }
        break;
      case ThemeState.Dark:
        {
          CacheHelper().saveData(key: 'them', value: 'd');
          emit(AppDarkTheme());
        }
        break;
      default:
    }
  }
}
