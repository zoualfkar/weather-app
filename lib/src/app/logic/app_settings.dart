import 'package:flutter/cupertino.dart';

import '../../core/common/domain/entites/countries.dart';
import '../../core/common/domain/entites/language.dart';
import '../../core/common/domain/entites/theme_modes.dart';

import '../../core/utils/managers/database/database_manager.dart';

class AppSettings {
  final DatabaseManager databaseManager;
  final Languages _languages = Languages();
  final Countries _countries = Countries();
  final ThemeModesData _themeModesData = ThemeModesData();

  late Language? _selectedLanguage;
  late Country? _selectedCountry;
  late bool? _notificationEnabled;
  late bool? _newsEnabled;

  late ThemeModeData? _selectedThemeModeData;
  String? _apiBaseUrl;
  bool? _hasConnection;

  AppSettings({required this.databaseManager});

  //* API Base Url
  String? get apiBaseUrl => _apiBaseUrl;

  set apiBaseUrl(String? value) => _apiBaseUrl = value;

  //* Has Connection
  bool? get hasConnection => _hasConnection;

  set hasConnection(bool? value) => _hasConnection = value;

  //* Languages
  Languages get languages {
    return _languages;
  }

  //* selected language
  Language get selectedLanguage {
    return _selectedLanguage!;
  }

  //! call in the root widget
  void changeSelectedLanguage(Locale selectedLocal) {
    _selectedLanguage = _languages.languagesData
        .firstWhere((element) => element.local == selectedLocal);
  }

  //* countries
  Countries get countries {
    return _countries;
  }

//* selected country
  Country get selectedCountry {
    return _selectedCountry!;
  }

  void changeSelectedCountry(int id) {
    _selectedCountry =
        _countries.countriesData.firstWhere((element) => element.id == id);
  }

  //* theme modes data

  int? get themeID {
    return databaseManager.getData("themeID") as int?;
  }

  //! call in the root widget
  set themeID(int? value) {
    databaseManager.saveData("themeID", value);
    _selectedThemeModeData =
        _themeModesData.values.firstWhere((element) => element.id == value);
  }

  ThemeModesData get themeModesData {
    return _themeModesData;
  }

  setNotificationEnabled(bool? value) {
    databaseManager.saveData("notificationEnabled", value);
  }

  bool? get notificationEnabled {
    bool? result = databaseManager.getData('notificationEnabled');
    return result;
  }



  setSelectedLang(int? value) {
    print("vlaue $value");
    databaseManager.saveData("selectedLang", value);
  }

  Language? get selectedLang {
    int? result = databaseManager.getData('selectedLang');
    print("result $result");
    late List<Language> languagesData = [];
    print("langs ${languagesData}");


    final Language ar = Language(
      id: 2,
      backendLangCode: 'ar',
      shortDisplayLabel: 'Ar',
      fullDisplayLabel: 'عربي',
      local: const Locale('ar', 'IQ'),
      flagImagePath: 'assets/images/icons/saudi arabia.svg',
    );

    final Language en = Language(
      id: 3,
      backendLangCode: 'en',
      shortDisplayLabel: 'En',
      fullDisplayLabel: 'English',
      local: const Locale('en', 'US'),
      flagImagePath: 'assets/images/icons/united kingdom.svg',
    );

    languagesData.addAll([ en, ar]);
    print("langs ${languagesData}");
    print(result);

    if (result == null) return en;
    Language? lang =
        languagesData.firstWhere((element) => element.id == result);
    return lang;
  }

  //* selected theme mode data
  ThemeModeData get selectedThemeModeData {
    return _selectedThemeModeData!;
  }

  //* Token
  String? get token {
    String? result = databaseManager.getData('token');
    return result;
  }

  set token(String? value) {
    databaseManager.saveData("token", value);
  }

  //* refreshToken
  String? get refreshToken {
    String? result = databaseManager.getData('refreshToken');
    return result;
  }

  set refreshToken(String? value) {
    databaseManager.saveData("refreshToken", value);
  }
}
